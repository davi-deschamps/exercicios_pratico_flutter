import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const AppCores());
}

// como as configurações gerais não mudam usamos Stateless
class AppCores extends StatelessWidget {
  const AppCores({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sorteador de Cores',
      theme: ThemeData.dark(), // Tema escuro
      home: const TelaSorteio(), // Chama a nossa tela principal
    );
  }
}

// como a cor vai mudar usamos Stateful - Classe da tela principal
class TelaSorteio extends StatefulWidget {
  const TelaSorteio({super.key});

  @override
  State<TelaSorteio> createState() => _TelaSorteioState();
}

class _TelaSorteioState extends State<TelaSorteio> {
  // cor inicial começa branca
  Color _corAtual = Colors.white;

  // gerar numeros aleatorios
  final Random _geradorNumero = Random();

  // sorteador
  void _sortearNovaCor() {
    // set para mudar a variavel
    setState(() {
      // sorteando um numero
      int numeroSorteado = _geradorNumero.nextInt(6);

      // Troca a cor conforme o numero
      switch (numeroSorteado) {
        case 0:
          _corAtual = Colors.red;
          break;
        case 1:
          _corAtual = Colors.green;
          break;
        case 2:
          _corAtual = Colors.blue;
          break;
        case 3:
          _corAtual = Colors.purple;
          break;
        case 4:
          _corAtual = Colors.yellow;
          break;
        case 5:
          _corAtual = Colors.pink;
          break;
      }
    });
  }

  // tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercicio 1: Cores aleatórias'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centraliza os itens na vertical
          children: [
            // texto
            Text(
              'Cor aleatoria',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: _corAtual, // a cor vem aleatoriamente da variavel
              ),
            ),

            const SizedBox(
              height: 40,
            ), // espaço vazio entre o botão e a cor aleatoria
            // botão
            ElevatedButton(
              onPressed: _sortearNovaCor, // quando preciona chama a função
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
              child: const Text('Sortear cor', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
