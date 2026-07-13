import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const AppRefatorado());
}

// enumerador para os estados possíveis do jogo
enum SituacaoJogo { jogando, vitoria, derrota }

// configurações gerais estaveis
class AppRefatorado extends StatelessWidget {
  const AppRefatorado({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo Refatorado',
      theme: ThemeData.dark(), // tema escuro padrão
      home: const TelaPrincipal(),
    );
  }
}

// tela que gerencia o estado e as variaveis
class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final Random _random = Random();

  // variaveis de controle e placar
  int _vitorias = 0;
  int _derrotas = 0;
  int _botaoCorreto = 0;
  int _cliques = 0;

  // inicializa o estado do jogo usando o enum
  SituacaoJogo _estadoAtual = SituacaoJogo.jogando;

  @override
  void initState() {
    super.initState();
    _iniciarNovoJogo();
  }

  // reinicia os valores para uma nova rodada
  void _iniciarNovoJogo() {
    setState(() {
      _botaoCorreto = _random.nextInt(3);
      _cliques = 0;
      _estadoAtual = SituacaoJogo.jogando;
    });
  }

  // valida a escolha do jogador
  void _processarTentativa(int opcao) {
    setState(() {
      if (opcao == _botaoCorreto) {
        _estadoAtual = SituacaoJogo.vitoria;
        _vitorias++;
      } else {
        _cliques++;
      }

      if (_cliques >= 2 && _estadoAtual != SituacaoJogo.vitoria) {
        _estadoAtual = SituacaoJogo.derrota;
        _derrotas++;
      }
    });
  }

  // expressão switch exaustiva para desenhar a tela correspondente
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercicio 3: Refatoração de código'),
        centerTitle: true,
      ),
      body: Center(
        child: switch (_estadoAtual) {
          SituacaoJogo.jogando => WidgetJogando(
            vitorias: _vitorias,
            derrotas: _derrotas,
            aoEscolher: _processarTentativa,
          ),
          SituacaoJogo.vitoria => WidgetFimJogo(
            mensagem: 'Você ganhou!',
            corFundo: Colors.green,
            aoReiniciar: _iniciarNovoJogo,
          ),
          SituacaoJogo.derrota => WidgetFimJogo(
            mensagem: 'Você perdeu!',
            corFundo: Colors.red,
            aoReiniciar: _iniciarNovoJogo,
          ),
        },
      ),
    );
  }
}

// widget separado para quando o jogo está rolando
class WidgetJogando extends StatelessWidget {
  final int vitorias;
  final int derrotas;
  final void Function(int) aoEscolher;

  const WidgetJogando({
    super.key,
    required this.vitorias,
    required this.derrotas,
    required this.aoEscolher,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // placar
        Text('Vitórias: $vitorias', style: const TextStyle(fontSize: 18)),
        Text('Derrotas: $derrotas', style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 30),

        // opcoes de botoes
        ElevatedButton(
          onPressed: () => aoEscolher(0),
          child: const Text('A', style: TextStyle(fontSize: 20)),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => aoEscolher(1),
          child: const Text('B', style: TextStyle(fontSize: 20)),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => aoEscolher(2),
          child: const Text('C', style: TextStyle(fontSize: 20)),
        ),
      ],
    );
  }
}

// widget separado para as telas de fim de jogo (vitoria ou derrota)
class WidgetFimJogo extends StatelessWidget {
  final String mensagem;
  final Color corFundo;
  final VoidCallback aoReiniciar;

  const WidgetFimJogo({
    super.key,
    required this.mensagem,
    required this.corFundo,
    required this.aoReiniciar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: corFundo,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            mensagem,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: aoReiniciar,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black54),
            child: const Text(
              'Jogar novamente',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
