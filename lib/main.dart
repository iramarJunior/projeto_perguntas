import 'package:flutter/material.dart';
import 'package:projeto_perguntas/answer.dart';
import 'package:projeto_perguntas/question.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _questionSelected = 0;

  void _responder() {
    setState(() {
      _questionSelected++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final questions = [
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

    List<Widget> answers = [];
    for (String answer in questions[_questionSelected].cast()['answers']) {
      answers.add(Answer(answer, _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: [
            Question(questions[_questionSelected]['question'].toString()),
            ...answers,
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}
