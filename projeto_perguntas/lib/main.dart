import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() {
    return _PerguntaAppState();
  }
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'resposta': ['Preto', 'Vermelho', 'Verde', 'Branco'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'resposta': ['Coelho', 'Cachorro', 'Gato', 'Jacaré'],
      },
      {
        'texto': 'Qual sua comida favorita?',
        'resposta': ['Pizza', 'Macarrão', 'Lasanha', 'Prefiro Doce'],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: _perguntaSelecionada < perguntas.length
            ? Column(
                children: [
                  Questao(
                    perguntas[_perguntaSelecionada]['texto'] as String,
                  ),
                  ...(perguntas[_perguntaSelecionada]['resposta']
                          as List<String>)
                      .map((resp) {
                    return Resposta(
                      texto: resp,
                      quandoSelecionado: _responder,
                    );
                  }).toList(),
                ],
              )
            : const Center(
                child: Text(
                  'Fim das perguntas!',
                  style: TextStyle(fontSize: 22),
                ),
              ),
      ),
    );
  }
}