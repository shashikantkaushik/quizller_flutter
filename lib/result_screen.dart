import 'package:flutter/material.dart';

import 'package:quiz_max/questions.dart';
import 'package:quiz_max/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestion=questions.length;
    final summaryData=getSummaryData();
    final correctQuestion=summaryData.where((data){
      return data['user_answer']==data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('You answered $correctQuestion out of $numTotalQuestion questions correctly!',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),textAlign: TextAlign.center,),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,


              icon:Icon( Icons.refresh),
            label:Text('Restart Quiz!',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}