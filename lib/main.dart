import 'package:flutter/material.dart';
import 'package:projeto_perguntas/quiz.dart';
import './result.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'question': 'Qual é sua cor favorita?',
      'answers': [
        {'text': 'Azul', 'score': 10},
        {'text': 'Verde', 'score': 5},
        {'text': 'Preto', 'score': 5},
        {'text': 'Vermelho', 'score': 5}
      ]
    },
    {
      'question': 'Qual é seu animal favorito?',
      'answers': [
        {'text': 'Gato', 'score': 5},
        {'text': 'Cachorro', 'score': 5},
        {'text': 'Ornitorrinco', 'score': 5},
        {'text': 'Dragão de Komoto', 'score': 10}
      ]
    },
    {
      'question': 'Qual é sua comida preferida?',
      'answers': [
        {'text': 'Macarronada', 'score': 5},
        {'text': 'Pizza', 'score': 5},
        {'text': 'Lasanha', 'score': 10},
        {'text': 'Churrasco', 'score': 5}
      ]
    },
    {
      'question': 'Qual é seu console preferido?',
      'answers': [
        {'text': 'PC', 'score': 10},
        {'text': 'XBox', 'score': 5},
        {'text': 'PlayStation', 'score': 5},
        {'text': 'Nintendo', 'score': 5}
      ]
    },
  ];

  void _toAnswer(int score) {
    if (haveSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
        _totalScore += score;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  bool get haveSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: haveSelectedQuestion
            ? Quiz(
                questions: _questions,
                selectedQuestion: _selectedQuestion,
                toAnswer: _toAnswer)
            : Result(_totalScore, _restartQuiz),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}
