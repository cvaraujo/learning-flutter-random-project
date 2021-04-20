import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var qIndex = 0;
  var totalScore = 0;

  static const question = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 7},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 2},
        {'text': 'Yellow', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 7},
        {'text': 'Pig', 'score': 5},
        {'text': 'Lion', 'score': 2},
        {'text': 'Tiger', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite anime?',
      'answers': [
        {'text': 'Jojo', 'score': 5},
        {'text': 'Boku no Hero', 'score': 10},
        {'text': 'One Piece', 'score': 10},
        {'text': 'Erased', 'score': 9},
        {'text': 'Tatshu Imortal', 'score': 10},
      ],
    },
  ];

  void answerQuestion(int score) {
    setState(() {
      totalScore += score;
      if (qIndex <= question.length) {
        qIndex++;
      }
    });
  }

  void restartQuiz() {
    setState(() {
      qIndex = 0;
      totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Favorite Things'),
        ),
        body: qIndex < question.length
            ? Quiz(
                answerQuestion: answerQuestion,
                qIndex: qIndex,
                question: question,
              )
            : Result(totalScore, restartQuiz),
      ),
    );
  }
}
