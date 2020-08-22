import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function resetQuiz;
  final int scorePoints;
  
  Result(this.resetQuiz, this.scorePoints);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text('You did it buddy, your score is' + scorePoints.toString()), FloatingActionButton(onPressed: () { resetQuiz(); },
      child: Text('reset'), )],
    );
  }
}
