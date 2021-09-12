import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(this.score, this.restartQuiz, {Key? key}) : super(key: key);

  final int score;
  final void Function() restartQuiz;

  String get textResult {
    if (score == 20) {
      return 'Você não me conhece!';
    } else if (score < 40) {
      return 'Você me conhece mais ou menos!';
    } else {
      return 'Você sabe tudo de mim!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              textResult,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        TextButton(
          child: const Text('Restart'),
          onPressed: restartQuiz,
        )
      ],
    );
  }
}
