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
      'answers': ['black', 'red', 'Green', 'White']
    },
    {
      'questext': 'What is your fav animal',
      'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion']
    },
    {
      'questext': 'Who is your fav Instructor',
      'answers': ['ABC', 'YXZ', 'PQR', 'CBD']
    },
  ];
  var _quesIndex = 0;
  void _answerQuestion() {
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
            : Result(),
      ),
    );
  }
}
