import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questext': 'What is your fav color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'white', 'score': 1}
      ]
    },
    {
      'questext': 'What is your fav animal',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elephant', 'score': 1},
        {'text': 'Lion', 'score': 20}
      ]
    },
    {
      'questext': 'Who is your fav Instructor',
      'answers': [
        {'text': 'ABC', 'score': 10},
        {'text': 'XYZ', 'score': 5},
        {'text': 'PQR', 'score': 1},
        {'text': 'CBD', 'score': 20}
      ]
    },
  ];
  var _quesIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _quesIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _quesIndex += 1;
    });

    print(_quesIndex);
    if (_quesIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more Questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('QUIZ APP'),
        ),
        body: _quesIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                quesIndex: _quesIndex,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
