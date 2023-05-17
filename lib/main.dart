import 'package:flutter/material.dart';
import 'package:quiz_max/question_screen.dart';
import 'package:quiz_max/start_screen.dart';
import 'package:quiz_max/quiz.dart';
void main() {


  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.deepPurpleAccent
            ],
                begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),

        ),
            child:  Quiz(),
        ),
      ),
    ),
  );
}
