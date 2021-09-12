import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  const Quiz({
    required this.questions,
    required this.selectedQuestion,
    required this.toAnswer,
    Key? key,
  }) : super(key: key);

  final int selectedQuestion;
  final List<Map<String, Object>> questions;
  final void Function(int) toAnswer;

  bool get haveSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = haveSelectedQuestion
        ? questions[selectedQuestion].cast()['answers']
        : [];

    return Column(
      children: [
        Question(questions[selectedQuestion]['question'].toString()),
        ...answers.map((answer) {
          return Answer(answer['text'].toString(),
              () => toAnswer(int.parse(answer['score'].toString())));
        }).toList(),
      ],
    );
  }
}
