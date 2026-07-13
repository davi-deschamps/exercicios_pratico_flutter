import 'package:flutter/material.dart';

void main() {
  runApp(const AppRetangulosColoridos());
}

// configuracoes gerais do app
class AppRetangulosColoridos extends StatelessWidget {
  const AppRetangulosColoridos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retângulos coloridos',
      theme: ThemeData.dark(), // tema escuro de fundo
      home: const TelaDesenho(),
    );
  }
}

// tela principal com os blocos alinhados
class TelaDesenho extends StatelessWidget {
  const TelaDesenho({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // centraliza na vertical
        crossAxisAlignment:
            CrossAxisAlignment.center, // alinha no centro horizontal
        children: [
          // primeira linha blocos vermelho verde e azul
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                width: 50,
                height: 50,
                color: Colors.red,
              ),
              Container(
                margin: const EdgeInsets.all(8),
                width: 50,
                height: 50,
                color: Colors.green,
              ),
              Container(
                margin: const EdgeInsets.all(8),
                width: 50,
                height: 50,
                color: Colors.cyan,
              ),
            ],
          ),

          // segunda linha retangulo maior amarelo com os retangulos e quadrados
          Container(
            color: Colors.yellow,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // retangulo roxo alto
                Container(
                  margin: const EdgeInsets.all(8),
                  width: 50,
                  height: 100,
                  color: Colors.purple,
                ),
                // retangulo ciano alto
                Container(
                  margin: const EdgeInsets.all(8),
                  width: 50,
                  height: 100,
                  color: Colors.cyan,
                ),
                // coluna interna com dois quadrados
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        width: 50,
                        height: 50,
                        color: Colors.purple,
                      ),
                      Container(width: 50, height: 50, color: Colors.cyan),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // terceira linha retangulo cinza com o quadrado preto no meio
          Container(
            color: Colors.grey,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Container(width: 50, height: 50, color: Colors.black)],
            ),
          ),
        ],
      ),
    );
  }
}
