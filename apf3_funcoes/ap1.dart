import 'package:flutter/material.dart';

void main() {
  runApp(const AppFormularioBasico());
}

// configuracoes gerais do app
class AppFormularioBasico extends StatelessWidget {
  const AppFormularioBasico({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulario Basico',
      theme: ThemeData.dark(), // tema escuro
      home: const Scaffold(body: SafeArea(child: TelaFormulario())),
    );
  }
}

// tela stateful que gerencia as validacoes e o estado
class TelaFormulario extends StatefulWidget {
  const TelaFormulario({super.key});

  @override
  State<TelaFormulario> createState() => _TelaFormularioState();
}

class _TelaFormularioState extends State<TelaFormulario> {
  // chaves e controladores com novos nomes
  final _chaveForm = GlobalKey<FormState>();
  final _campoNome = TextEditingController();
  final _campoIdade = TextEditingController();

  bool _usuarioInativo = false;

  // variaveis que guardam os dados validados
  String? _nomeValidado;
  int? _idadeValidada;
  bool? _statusInativoValidado;

  // checa se ja existem dados salvos para exibir o container
  bool get _temDadosSalvos =>
      _nomeValidado != null &&
      _idadeValidada != null &&
      _statusInativoValidado != null;

  // executa a validacao ao clicar no botao
  void _salvarFormulario() {
    if (_chaveForm.currentState!.validate()) {
      setState(() {
        _nomeValidado = _campoNome.text;
        _idadeValidada = int.tryParse(_campoIdade.text) ?? 0;
        _statusInativoValidado = _usuarioInativo;
      });
    } else {
      print("formulario contem erros");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Form(
        key: _chaveForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // campo do nome com as regras
            TextFormField(
              controller: _campoNome,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Nome completo'),
              validator: (valor) {
                if (valor == null || valor.isEmpty) {
                  return 'Nome não pode ser vazio';
                }
                if (valor.length < 3) {
                  return 'Não pode ter menos de 3 letras';
                }
                if (valor.startsWith(RegExp(r'[^A-Z]'))) {
                  return 'Precisa comecar com uma letra maiuscula';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),

            // campo da idade com as regras
            TextFormField(
              controller: _campoIdade,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Idade'),
              validator: (valor) {
                if (valor == null || valor.isEmpty) {
                  return 'Idade obrigatoria';
                }
                final idadeNum = int.tryParse(valor);
                if (idadeNum == null || idadeNum < 18) {
                  return 'Precisa ser maior de idade';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),

            // checkbox para indicar se esta inativo
            Row(
              children: [
                Checkbox(
                  value: _usuarioInativo,
                  onChanged: (bool? mudou) {
                    setState(() {
                      _usuarioInativo = mudou!;
                    });
                  },
                ),
                Text(_usuarioInativo ? 'Usuario Inativo' : 'Usuario Ativo'),
              ],
            ),
            const SizedBox(height: 15),

            // botao de ação
            ElevatedButton(
              onPressed: _salvarFormulario,
              child: const Text('Salvar'),
            ),
            const SizedBox(height: 10),

            // exibe o resumo destacado apenas se o formulario for valido
            if (_temDadosSalvos) ...[
              const Text(
                'Dados salvos:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BoxResumoDados(
                nome: _nomeValidado!,
                idade: _idadeValidada!,
                inativo: _statusInativoValidado!,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// widget separado para mostrar o painel colorido de dados salvos
class BoxResumoDados extends StatelessWidget {
  final String nome;
  final int idade;
  final bool inativo;

  const BoxResumoDados({
    super.key,
    required this.nome,
    required this.idade,
    required this.inativo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: inativo
            ? Colors.grey
            : Colors.green, // muda a cor baseado no status
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nome: $nome', style: const TextStyle(color: Colors.black)),
          Text('Idade: $idade', style: const TextStyle(color: Colors.black)),
          Text(
            inativo ? 'Status: Inativo' : 'Status: Ativo',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
