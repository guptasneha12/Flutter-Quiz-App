
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';



// This is statless widget because it does not manage any state

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key,required this.chosenAnswers,required this.onRestart});

// to restart the quiz
  final void Function() onRestart;
// passing the selected answers into the result screen
final List<String> chosenAnswers;

// to combine our choosen answers with the questions
// map stores key-value pair  Object allows us to store all kind of values
List<Map<String,Object>> get summaryData{
final List<Map<String,Object>> summary=[];
// populate the list 
for(var i=0;i<chosenAnswers.length;i++){
  // loop body
  // add items to summary list
  summary.add({
    'question_index':i,
    'question':questions[i].text,
    'correct_answer':questions[i].answers[0],
    'user_answer':chosenAnswers[i]

  });
}

return summary;
}

  @override
  Widget build(context) {
// to dynamically derive the value of questions you have answered

final numTotalQuestions=questions.length;   // total questions present
final numCorrectQuestions=summaryData.where((data)=>    // this is the arrow function 
  // return true; // if data list is present in the where list 
data['user_answer']==data['correct_answer']
).length;     // here length gives the amount of items kept in the filtered list


    return SizedBox(
      width: double
          .infinity, // it means use as much as possible and be wide as possible
      child: Container(
        margin: const EdgeInsets.all(20),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numCorrectQuestions out of $numTotalQuestions Questions Correctly!',style: const TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
            const SizedBox(height: 30,),
            // scrrolable list of answers
           QuestionsSummary(summaryData),
            const SizedBox(height: 30,),
            // button to restart the quiz
              TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}








