import 'package:flutter/material.dart';

void main() {
  runApp(const AppQuadradosEmpilhados());
}

// configuracoes basicas do app
class AppQuadradosEmpilhados extends StatelessWidget {
  const AppQuadradosEmpilhados({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quadrados Empilhados',
      theme: ThemeData.dark(),
      home: const TelaPilhas(),
    );
  }
}

// tela principal que organiza as pilhas lado a lado
class TelaPilhas extends StatelessWidget {
  const TelaPilhas({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.center, // alinha no centro horizontal
          children: [
            // bloco 1 fundo cinza com vermelho verde e azul
            BlocoPilha(
              corFundo: Colors.grey,
              coresQuadrados: [Colors.red, Colors.green, Colors.blue],
            ),
            // bloco 2 fundo preto com ciano roxo e amarelo
            BlocoPilha(
              corFundo: Colors.black,
              coresQuadrados: [Colors.cyan, Colors.purple, Colors.yellow],
            ),
            // bloco 3 sem fundo com vermelho, amarelo e azul
            BlocoPilha(
              coresQuadrados: [Colors.red, Colors.yellow, Colors.blue],
            ),
            // bloco 4 fundo branco com roxo laranja amarelo e verde claro
            BlocoPilha(
              corFundo: Colors.white,
              coresQuadrados: [
                Color.fromARGB(255, 128, 10, 219),
                Color.fromARGB(255, 246, 78, 27),
                Colors.yellow,
                Color.fromARGB(255, 209, 225, 62),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// widget para desenhar a pilha de quadrados
class BlocoPilha extends StatelessWidget {
  final Color? corFundo;
  final List<Color> coresQuadrados;

  const BlocoPilha({super.key, this.corFundo, required this.coresQuadrados});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 100,
      height: 100,
      color: corFundo,
      child: Stack(
        children: [
          // loop para criar e deslocar os quadrados
          for (int i = 0; i < coresQuadrados.length; i++)
            Positioned(
              top: (i * 10) + 10, // deslocamento vertical
              left: (i * 10) + 10, // deslocamento horizontal
              child: Container(width: 50, height: 50, color: coresQuadrados[i]),
            ),
        ],
      ),
    );
  }
}

// Obs: ficou fora da tela do celular mas como tem que seguir as regras da atividade 
// não tem como colocar os 4 100x100 na vertical na tela 