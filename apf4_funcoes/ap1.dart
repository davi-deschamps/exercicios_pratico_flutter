import 'package:flutter/material.dart';

void main() {
  runApp(const AppListaCores());
}

// configuracao das rotas nomeadas do aplicativo
class AppListaCores extends StatelessWidget {
  const AppListaCores({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de cores',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaListaCores(),
        '/detalhe': (context) {
          // pega a cor passada por argumento para a nova tela
          final corRecebida =
              ModalRoute.of(context)!.settings.arguments as Color;
          return TelaFundoColorido(corDeFundo: corRecebida);
        },
      },
    );
  }
}

// estrururando os dados de cada linha
class ModeloCor {
  final Color corHex;
  final String nomeTexto;

  const ModeloCor(this.corHex, this.nomeTexto);
}

// tela principal com a listview das cores
class TelaListaCores extends StatelessWidget {
  const TelaListaCores({super.key});

  // lista com as cores
  final List<ModeloCor> _colecaoCores = const [
    ModeloCor(Colors.pink, "Rosa"),
    ModeloCor(Colors.yellow, "Amarelo"),
    ModeloCor(Colors.blue, "Azul"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Escolha uma Cor")),
      body: ListView.builder(
        itemCount: _colecaoCores.length,
        itemBuilder: (context, indice) {
          final itemCor = _colecaoCores[indice];
          return LinhaSelecaoCor(dadosCor: itemCor);
        },
      ),
    );
  }
}

// widget para deixar cada linha clicavel
class LinhaSelecaoCor extends StatelessWidget {
  final ModeloCor dadosCor;

  const LinhaSelecaoCor({super.key, required this.dadosCor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // navega para a rota passando a cor
        Navigator.of(context).pushNamed('/detalhe', arguments: dadosCor.corHex);
      },
      child: Container(
        color: dadosCor.corHex,
        height: 100,
        child: Center(
          child: Text(
            dadosCor.nomeTexto,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }
}

// tela que muda a cor conforme cor selecionada
class TelaFundoColorido extends StatelessWidget {
  final Color corDeFundo;

  const TelaFundoColorido({super.key, required this.corDeFundo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fundo Colorido")),
      body: Container(
        color: corDeFundo, // aplica a cor recebida no container de fundo
      ),
    );
  }
}
