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

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
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
        'resposta': ['Pizza', 'Macarrão', 'Lasanha', 'Prefiro Doce🤤🧁'],
      },
    ];

    final bool temPerguntaSelecionada =
        _perguntaSelecionada < perguntas.length;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
          centerTitle: true,
        ),
        body: temPerguntaSelecionada
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Questao(
                      perguntas[_perguntaSelecionada]['texto'] as String,
                    ),
                    const SizedBox(height: 20),
                    ...(perguntas[_perguntaSelecionada]['resposta']
                            as List<String>)
                        .map((resp) {
                      return Resposta(
                        texto: resp,
                        quandoSelecionado: _responder,
                      );
                    }).toList(),
                  ],
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Fim das perguntas!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _reiniciarQuestionario,
                      child: const Text('Reiniciar'),
                     
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}