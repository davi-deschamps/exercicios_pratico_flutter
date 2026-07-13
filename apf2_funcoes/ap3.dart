import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const AppFormatosdinamicos());
}

// configuracoes basicas do app
class AppFormatosdinamicos extends StatelessWidget {
  const AppFormatosdinamicos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formatos Dinamicos',
      theme: ThemeData.dark(),
      home: const TelaFormatos(),
    );
  }
}

// tela stateful para gerenciar as mudancas de cor e formato
class TelaFormatos extends StatefulWidget {
  const TelaFormatos({super.key});

  @override
  State<TelaFormatos> createState() => _TelaFormatosState();
}

class _TelaFormatosState extends State<TelaFormatos> {
  final Random _random = Random();

  // variaveis de estado
  bool _ehQuadrado = true;
  Color _corAtual = Colors.orange;

  // define o texto do botao baseado na forma atual
  String get _textoBotaoForma =>
      _ehQuadrado ? 'Mudar para círculo' : 'Mudar para quadrado';

  // sorteia uma nova cor para o container
  void _mudarCorAleatoria() {
    setState(() {
      int sorteio = _random.nextInt(5);
      switch (sorteio) {
        case 0:
          _corAtual = Colors.red;
          break;
        case 1:
          _corAtual = Colors.purple;
          break;
        case 2:
          _corAtual = Colors.green;
          break;
        case 3:
          _corAtual = Colors.yellow;
          break;
        case 4:
          _corAtual = Colors.blue;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // linha com os dois botoes de acao
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _ehQuadrado = !_ehQuadrado; // inverte a forma
                    });
                  },
                  child: Text(_textoBotaoForma),
                ),
                const SizedBox(width: 20), // espaco entre botoes
                ElevatedButton(
                  onPressed: _mudarCorAleatoria,
                  child: const Text('Cor aleatoria'),
                ),
              ],
            ),
            const SizedBox(height: 50), // espaco antes da forma
            // desenho da forma
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: _corAtual,
                shape: _ehQuadrado ? BoxShape.rectangle : BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
