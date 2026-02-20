import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  const Resposta({
    super.key,
    required this.texto,
    required this.quandoSelecionado,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        onPressed: quandoSelecionado,
        child: Text(
          texto,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}