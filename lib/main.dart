import 'package:flutter/material.dart';
import './question.dart';
import './ans.dart';

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
  var _quesIndex = 0;
  void _answerQuestion() {
    setState(() {
      _quesIndex += 1;
    });

    print(_quesIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('QUIZ APP'),
        ),
        body: Column(
          children: [
            Question(
              questions[_quesIndex]['questext']
              ),
            ...(questions[_quesIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
