import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
                (data) {
                  final bool isCorrect=data['user_answer']==data['correct_answer'];
              return Row(
                children: [
                  CircleAvatar(
                      backgroundColor: isCorrect ? Colors.blue : Colors.red,
                      child: Text(((data['question_index'] as int) + 1).toString(),style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold,),)),
                  SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question'] as String,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['user_answer'] as String,style: TextStyle(color: Colors.deepOrangeAccent),),
                        Text(data['correct_answer'] as String,style: TextStyle(color: Colors.blue),),
                        SizedBox(height: 18,)
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}