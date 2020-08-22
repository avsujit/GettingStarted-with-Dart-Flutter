import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyFirstApp());
}

class MyFirstApp extends StatefulWidget {
  @override
  _MyFirstAppState createState() => _MyFirstAppState();
}

class _MyFirstAppState extends State<MyFirstApp> {
  int _questionIndex = 0;
  int _scorePoints = 0;
  final questions = const [
    {
      'questionText': 'what\'s your favourite color',
      'answers': [
        {'text': 'Black', 'points': 10},
        {'text': 'Blue', 'points': 5}
      ]
    },
    {
      'questionText': 'what\'s your favourite sport',
      'answers': [
        {'text': 'Cricket', 'points': 10},
        {'text': 'Badminton', 'points': 5}
      ]
    },
    {
      'questionText': 'what\'s your favourite animal',
      'answers': [
        {'text': 'Lion', 'points': 10},
        {'text': 'Dog', 'points': 10}
      ]
    },
  ];
  _answerFunction(int points) {
    if (_questionIndex < questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
        _scorePoints += points;
      });
      print(_questionIndex);
    } else {
      print('quiz completed');
    }
  }

  _resetQuiz() {
    setState(() {
      _questionIndex = 0;
    });
    _scorePoints = 0;
  }

  Widget build(BuildContext context) {
    // return MaterialApp(home: Text('Hello , Welcome to my first app !!'));

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          // body: Text('Welcome buddy !!')
          body: _questionIndex < questions.length
              ? Quiz(
                  questions: questions,
                  questionIndex: _questionIndex,
                  answerFunction: _answerFunction)
              : Result(_resetQuiz, _scorePoints)),
    );
  }
}
