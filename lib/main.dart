import 'package:flutter/material.dart';
import 'package:projeto_perguntas/answer.dart';
import 'package:projeto_perguntas/question.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _questionSelected = 0;

  final _questions = const [
    {
      'question': 'Qual é sua cor favorita?',
      'answers': ['Azul', 'Verde', 'Preto', 'Vermelho']
    },
    {
      'question': 'Qual é seu animal favorito?',
      'answers': ['Gato', 'Cachorro', 'Ornitorrinco', 'Dragão de Komoto']
    },
    {
      'question': 'Qual é sua comida preferida?',
      'answers': ['Macarronada', 'Pizza', 'Lasanha', 'Churrasco']
    },
    {
      'question': 'Qual é seu console preferido?',
      'answers': ['PC', 'XBox', 'PlayStation', 'Nintendo']
    },
  ];

  void _toAnswer() {
    if (haveSelectedQuestion) {
      setState(() {
        _questionSelected++;
      });
    }
  }

  bool get haveSelectedQuestion {
    return _questionSelected < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> answers = haveSelectedQuestion
        ? _questions[_questionSelected].cast()['answers']
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: haveSelectedQuestion
            ? Column(
                children: [
                  Question(
                      _questions[_questionSelected]['question'].toString()),
                  ...answers
                      .map((answer) => Answer(answer, _toAnswer))
                      .toList(),
                ],
              )
            : null,
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}
