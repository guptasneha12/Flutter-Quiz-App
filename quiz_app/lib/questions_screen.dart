import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // for changing the style of question
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key,required this.onSelectAnswer,});
  final void Function(String answer) onSelectAnswer;    //onSelectAnswer is the name of function
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

// private class
class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0; // initial question
  void answerQuestion(String selectedAnswers) {
    // to execute the build method again we create setState method
    
    widget.onSelectAnswer(selectedAnswers);     // widget is the property of flutter that helps us to use all the properties of the widget class
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double
          .infinity, // it means use as much as possible and be wide as possible
      child: Container(
        margin: const EdgeInsets.all(
            20), // this will set margin equally in all directions
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // this is for vertical axis
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // this is for horizontal axis
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // output the answer button dynammically  map converts one item to another here it converts list of items into widgets
            ...currentQuestion.shuffledAnswer.map((answer) {
              // map does not change the existing list instead it returns the new list
              return AnswerButton(answerText: answer, onTap: (){
                answerQuestion(answer);
              });
            })

            // another method
            // use our custom widget for  same styling for each buttons
            // AnswerButton(answerText: currentQuestion.answers[0],onTap: (){},),
            // AnswerButton(answerText: currentQuestion.answers[1],onTap: (){},),
            // AnswerButton(answerText: currentQuestion.answers[2],onTap: (){},),
            // AnswerButton(answerText: currentQuestion.answers[3],onTap: (){},),
          ],
        ),
      ),
    );
  }
}







