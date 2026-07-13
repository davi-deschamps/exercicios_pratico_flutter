import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const AppOpcao());
}

// como as configurações gerais não mudam usamos Stateless
class AppOpcao extends StatelessWidget {
  const AppOpcao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Opção aleatória',
      theme: ThemeData.dark(), // Tema escuro
      home: const TelaJogo(),
    );
  }
}

// como a tela muda de cor e tem cliques usamos Stateful
class TelaJogo extends StatefulWidget {
  const TelaJogo({super.key});

  @override
  State<TelaJogo> createState() => _TelaJogoState();
}

class _TelaJogoState extends State<TelaJogo> {
  final Random _random = Random();

  int _botaoCorreto = 0;
  int _erros = 0;
  bool _ganhou = false;
  bool _perdeu = false;

  // chamado uma vez quando a tela inicia
  @override
  void initState() {
    super.initState();
    // sorteia o botao correto
    _botaoCorreto = _random.nextInt(3);
  }

  // funcao para verificar o clique do usuario
  void _verificarTentativa(int opcaoEscolhida) {
    setState(() {
      if (opcaoEscolhida == _botaoCorreto) {
        _ganhou = true;
      } else {
        // se errou aumenta o contador de erros
        _erros++;
      }

      // se errou 2 vezes perdeu o jogo
      if (_erros >= 2) {
        _perdeu = true;
      }
    });
  }

  // tela
  @override
  Widget build(BuildContext context) {
    // tela de vitoria
    if (_ganhou) {
      return const Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Text(
            'Você ganhou',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    // tela de derrota
    if (_perdeu) {
      return const Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Text(
            'Você perdeu',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    // tela do jogo
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercicio 2: Opção aleatória'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // centraliza itens na vertical
          children: [
            const Text(
              'Escolha o botão correto:',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 30), // espaço vazio
            // botoes do jogo
            ElevatedButton(
              onPressed: () => _verificarTentativa(0), // botao A
              child: const Text('A', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () => _verificarTentativa(1), // botao B
              child: const Text('B', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () => _verificarTentativa(2), // botao C
              child: const Text('C', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
