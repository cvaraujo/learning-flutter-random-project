import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function restart;

  Result(this.resultScore, this.restart);

  String get resultPhrase {
    return "You earned " + resultScore.toString() + " points!";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text(
              'Restart Quiz!',
            ),
            style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.blue)),
            onPressed: restart,
          ),
        ],
      ),
    );
  }
}
