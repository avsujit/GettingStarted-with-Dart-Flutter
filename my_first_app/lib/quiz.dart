import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final questions;
  final questionIndex;
  final Function answerFunction;
  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.answerFunction});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(questions[questionIndex]['questionText']),
      ...(questions[questionIndex]['answers'] as List<Map<String,Object>>).map((answer) {
        return Answer(() => answerFunction(answer['points']), answer['text']);
      }).toList()
    ]);
  }
}
