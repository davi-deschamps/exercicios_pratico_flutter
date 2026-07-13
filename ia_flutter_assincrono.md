# Atividade: Flutter e Programação Assíncrona - Conceitos

## Perguntas e Respostas

**1. O que são isolates em flutter?**
Sao linhas de execucao separadas que nao compartilham memoria entre si. Servem para rodar tarefas muito pesadas (ex: processar imagens) em segundo plano sem travar a tela principal do app.

**2. O que é um 'Future' em Dart e como ele funciona?**
E um objeto que representa uma promessa de um valor que estara pronto depois. Ele funciona entrando em um estado incompleto e, apos a tarefa terminar, muda para concluido com sucesso ou com erro.

**3. Como posso acessar valores específicos em um objeto JSON?**
Apos decodificar o JSON com `jsonDecode`, ele vira um mapa (`Map`). Voce acessa os valores passando a chave entre colchetes (ex: `dados['nome']`).

**4. Como posso lidar com arrays (listas) em JSON em Flutter?**
Apos decodificar, o array vira uma `List<dynamic>`. Voce precisa converter ou mapear essa lista generica para o tipo de dado especifico que voce quer usar no Flutter.

**5. Como posso iterar sobre os elementos de um array JSON?**
Utilizando estruturas de repeticao como o `for-in` ou usando o metodo `.map()` combinado com `.toList()` para transformar os itens de forma direta.

**6. Por que é útil mapear JSON para classes Dart?**
Porque evita erros de digitacao ao escrever chaves como Strings, garante a tipagem correta dos dados (int, String, bool) e ativa o autocompletar do VS Code.

**7. Como posso usar 'factory' para criar objetos Dart a partir de JSON?**
Criando um construtor do tipo `factory` (geralmente chamado `fromJson`) que recebe o mapa do JSON, trata os dados e retorna uma nova instancia da classe ja preenchida.

**8. Como posso usar 'toJson()' para converter objetos Dart em JSON?**
Criando um metodo na classe que pega as propriedades do objeto e as devolve organizadas dentro de um `Map<String, dynamic>`, que depois pode ser passado no `jsonEncode`.

**9. Como organizar minhas requisições no meu código Flutter?**
Separando a logica em classes isoladas chamadas Repositories ou Services (ex: `UsuarioRepository`). Nunca faça requisicoes HTTP diretas de dentro dos widgets da tela.

---

## Minhas Observacoes
* cada isolate do flutter tem seu proprio loop de eventos e bloco de memoria isolado.
* mapear listas de json exige usar o metodo .map() para converter cada item do mapa em um objeto dart.
* separar as requisicoes em repositories deixa o codigo das telas limpo e facil de dar manutencao.