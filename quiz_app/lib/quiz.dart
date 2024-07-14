import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    // here createState creates the instance of _QuizState
    return _QuizState();
  }
}

// private class
class _QuizState extends State<Quiz> {
// storing a widget in a variable/widget
// Widget? activeScreen;    // ? shows that active screen can have a value NULL
// @override
//   void initState() {
//     activeScreen=StartScreen(switchScreen);
//     super.initState();
//   }

// to store the selected answer which is initially empty
  List<String> selectedAnswers=[];



// alternative method to avoid initState() use ternary operator
  var activeScreen = 'start-screen';

// this is the method used to switch btw different screens
  void switchScreen() {
    setState(() {
      // in this function we can perform any data changing activity that changes everytime
      activeScreen =
          'questions-screen'; // active screen changes with the questions screen
    });
  }

// method to add answers to selected answers list
void chooseAnswer(String answer){
  selectedAnswers.add(answer);   // add() is the default method which is provided by the flutter to add new value to the list

// to check whether we answered all questions or not
if(selectedAnswers.length==questions.length){
  // we ran out of question then we have to display the result screen
  setState(() {
    // selectedAnswers=[];   // on again starting of quiz reset the selectedAnswer list
    activeScreen='results-screen';
  });
}

}

  void restartQuiz() {
    setState(() {
      selectedAnswers=[];
      activeScreen = 'questions-screen';
    });
  }



  @override
  Widget build(context) {

    // this is 1st approach
    // final screenWidget=activeScreen == 'start-screen'
    //           ? StartScreen(switchScreen)
    //           : const QuestionsScreen();

     // this is 2nd approach   using if conditionz       
Widget screenWidget=StartScreen(switchScreen);
if(activeScreen=='questions-screen'){
  screenWidget= QuestionsScreen(onSelectAnswer:chooseAnswer);  // pass choosenaswer as a pointer to get the answer selected from the question screen
}


// check if currrent screen value is result screen or not
if(activeScreen=='results-screen'){
  screenWidget= ResultsScreen(chosenAnswers: selectedAnswers,onRestart:restartQuiz);
}

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.lightBlue,
              ],
              // to add the alignment of gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: activeScreen,   ternary operator
          child: screenWidget,
        ), // it takes our custom widget
      ),
    );
  }
}
