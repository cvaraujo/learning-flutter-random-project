import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int qIndex;
  final Function answerQuestion;

  Quiz({
      @required this.question,
      @required this.answerQuestion,
      @required this.qIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questions(
          question[qIndex]['questionText'],
        ),
        ...(question[qIndex]['answers'] as List<Map<String, Object>>).map((answer) {
            return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
