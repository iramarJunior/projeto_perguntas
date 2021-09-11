import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer(this.text, this.onSelected, {Key? key}) : super(key: key);

  final String text;
  final void Function() onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: onSelected,
      ),
    );
  }
}
