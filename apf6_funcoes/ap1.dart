import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(
    // estado aqui para todas as telas acessarem
    ChangeNotifierProvider(
      create: (context) => EstadoListaDePessoas(),
      child: const MyApp(),
    ),
  );
}

// tipos sanguineos
enum TipoSanguineo {
  aPositivo,
  aNegativo,
  bPositivo,
  bNegativo,
  oPositivo,
  oNegativo,
  abPositivo,
  abNegativo,
}

// retornar a cor e o enum
extension TipoSanguineoExt on TipoSanguineo {
  String get nomeDisplay {
    switch (this) {
      case TipoSanguineo.aPositivo:
        return "A+";
      case TipoSanguineo.aNegativo:
        return "A-";
      case TipoSanguineo.bPositivo:
        return "B+";
      case TipoSanguineo.bNegativo:
        return "B-";
      case TipoSanguineo.oPositivo:
        return "O+";
      case TipoSanguineo.oNegativo:
        return "O-";
      case TipoSanguineo.abPositivo:
        return "AB+";
      case TipoSanguineo.abNegativo:
        return "AB-";
    }
  }

  Color get corDisplay {
    switch (this) {
      case TipoSanguineo.aPositivo:
        return Colors.blue;
      case TipoSanguineo.aNegativo:
        return Colors.red;
      case TipoSanguineo.bPositivo:
        return Colors.purple;
      case TipoSanguineo.bNegativo:
        return Colors.orange;
      case TipoSanguineo.oPositivo:
        return Colors.green;
      case TipoSanguineo.oNegativo:
        return Colors.yellow;
      case TipoSanguineo.abPositivo:
        return Colors.cyan;
      case TipoSanguineo.abNegativo:
        return Colors.white;
    }
  }
}

class Pessoa {
  const Pessoa({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.github,
    required this.tipoSanguineo,
  });

  final String nome;
  final String email;
  final String telefone;
  final String github;
  final TipoSanguineo tipoSanguineo;

  // implementação para comparacao para editar e excluir
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Pessoa &&
        other.nome == nome &&
        other.email == email &&
        other.telefone == telefone &&
        other.github == github &&
        other.tipoSanguineo == tipoSanguineo;
  }

  @override
  int get hashCode {
    return nome.hashCode ^
        email.hashCode ^
        telefone.hashCode ^
        github.hashCode ^
        tipoSanguineo.hashCode;
  }
}

class EstadoListaDePessoas with ChangeNotifier {
  final _listaDePessoas = <Pessoa>[];
  String _termoFiltro = '';

  // retorna a lista filtrada ou completa
  List<Pessoa> get pessoas {
    if (_termoFiltro.isEmpty) {
      return List.unmodifiable(_listaDePessoas);
    }
    return _listaDePessoas
        .where((p) => p.nome.toLowerCase().contains(_termoFiltro.toLowerCase()))
        .toList();
  }

  // inclui ou exclui pessoas da lista conforme filtro
  void setFiltro(String filtro) {
    _termoFiltro = filtro;
    notifyListeners();
  }

  void incluir(Pessoa pessoa) {
    _listaDePessoas.add(pessoa);
    notifyListeners();
  }

  void excluir(Pessoa pessoa) {
    _listaDePessoas.remove(pessoa);
    notifyListeners();
  }

  // pega a pessoa antiga e substitui pelos dados novos
  void editar(Pessoa antiga, Pessoa nova) {
    final index = _listaDePessoas.indexOf(antiga);
    if (index != -1) {
      _listaDePessoas[index] = nova;
      notifyListeners();
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaInicial(),
        '/lista': (context) => const TelaListagem(),
        '/form': (context) {
          // recebe a pessoa por argumento para a edicao
          final pessoa = ModalRoute.of(context)?.settings.arguments as Pessoa?;
          return TelaFormulario(pessoaEdicao: pessoa);
        },
      },
    );
  }
}

// menu principal
class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Doadores de Sangue')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/lista'),
              child: const Text('Ver Lista de Pessoas'),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/form'),
              child: const Text('Cadastrar Nova Pessoa'),
            ),
          ],
        ),
      ),
    );
  }
}

// lista das pessoas filtradas
class TelaListagem extends StatelessWidget {
  const TelaListagem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Cadastros')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Filtrar por nome',
                border: OutlineInputBorder(),
              ),
              onChanged: (valor) {
                // atualiza o filtro no provider
                Provider.of<EstadoListaDePessoas>(
                  context,
                  listen: false,
                ).setFiltro(valor);
              },
            ),
          ),
          Expanded(
            child: Consumer<EstadoListaDePessoas>(
              builder: (context, estado, _) {
                final pessoas = estado.pessoas;
                if (pessoas.isEmpty) {
                  return const Center(
                    child: Text('Nenhuma pessoa encontrada.'),
                  );
                }
                return ListView.builder(
                  itemCount: pessoas.length,
                  itemBuilder: (context, index) {
                    final p = pessoas[index];
                    return Card(
                      color: p.tipoSanguineo.corDisplay,
                      child: ListTile(
                        // coloca a cor do texto em preto
                        title: Text(
                          p.nome,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${p.tipoSanguineo.nomeDisplay} - ${p.email}\n${p.telefone} - ${p.github}',
                          style: const TextStyle(color: Colors.black87),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.black),
                              onPressed: () => Navigator.pushNamed(
                                context,
                                '/form',
                                arguments: p,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                              onPressed: () => estado.excluir(p),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Formulario para inclusão e exclusão
class TelaFormulario extends StatefulWidget {
  final Pessoa? pessoaEdicao;

  const TelaFormulario({super.key, this.pessoaEdicao});

  @override
  State<TelaFormulario> createState() => _TelaFormularioState();
}

class _TelaFormularioState extends State<TelaFormulario> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nomeCtrl;
  late TextEditingController _emailCtrl;
  late TextEditingController _telefoneCtrl;
  late TextEditingController _githubCtrl;
  TipoSanguineo? _tipoSelecionado;

  @override
  void initState() {
    super.initState();
    // preenche os dados se for uma edicao
    final p = widget.pessoaEdicao;
    _nomeCtrl = TextEditingController(text: p?.nome ?? '');
    _emailCtrl = TextEditingController(text: p?.email ?? '');
    _telefoneCtrl = TextEditingController(text: p?.telefone ?? '');
    _githubCtrl = TextEditingController(text: p?.github ?? '');
    _tipoSelecionado = p?.tipoSanguineo;
  }

  @override
  void dispose() {
    _nomeCtrl.dispose();
    _emailCtrl.dispose();
    _telefoneCtrl.dispose();
    _githubCtrl.dispose();
    super.dispose();
  }

  void _salvar() {
    if (_formKey.currentState!.validate() && _tipoSelecionado != null) {
      final pessoaCriada = Pessoa(
        nome: _nomeCtrl.text,
        email: _emailCtrl.text,
        telefone: _telefoneCtrl.text,
        github: _githubCtrl.text,
        tipoSanguineo: _tipoSelecionado!,
      );

      final estado = Provider.of<EstadoListaDePessoas>(context, listen: false);

      if (widget.pessoaEdicao == null) {
        estado.incluir(pessoaCriada);
      } else {
        estado.editar(widget.pessoaEdicao!, pessoaCriada);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final eEdicao = widget.pessoaEdicao != null;

    return Scaffold(
      appBar: AppBar(title: Text(eEdicao ? 'Editar Pessoa' : 'Nova Pessoa')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomeCtrl,
                decoration: const InputDecoration(labelText: 'Nome Completo'),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Campo obrigatorio' : null,
              ),
              TextFormField(
                controller: _emailCtrl,
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Campo obrigatorio' : null,
              ),
              TextFormField(
                controller: _telefoneCtrl,
                decoration: const InputDecoration(labelText: 'Telefone'),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Campo obrigatorio' : null,
              ),
              TextFormField(
                controller: _githubCtrl,
                decoration: const InputDecoration(labelText: 'Link do GitHub'),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Campo obrigatorio' : null,
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<TipoSanguineo>(
                value: _tipoSelecionado,
                decoration: const InputDecoration(labelText: 'Tipo Sanguineo'),
                items: TipoSanguineo.values.map((tipo) {
                  return DropdownMenuItem(
                    value: tipo,
                    child: Text(tipo.nomeDisplay),
                  );
                }).toList(),
                onChanged: (val) => setState(() => _tipoSelecionado = val),
                validator: (val) => val == null ? 'Selecione o tipo' : null,
              ),
              const SizedBox(height: 40),
              ElevatedButton(onPressed: _salvar, child: const Text('Salvar')),
            ],
          ),
        ),
      ),
    );
  }
}
