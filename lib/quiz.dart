import 'package:flutter/material.dart';

import './question.dart';
import './ans.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int quesIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.quesIndex});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[quesIndex]['questext']),
        ...(questions[quesIndex]['answers'] as List<Map<String,Object>>).map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
