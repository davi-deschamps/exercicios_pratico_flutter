# Atividade: Flutter e Gerenciamento de Estados - Avançado

## Perguntas e Respostas

**1. O que é o ChangeNotifierProvider e como ele funciona?**
E um widget do pacote `provider` que gerencia e fornece uma instancia de `ChangeNotifier` para a arvore de widgets. Ele funciona escutando o metodo `notifyListeners()` e avisando os widgets dependentes para se reconstruirem.

**2. Como posso fornecer um ChangeNotifier para a árvore de widgets usando ChangeNotifierProvider?**
Declarando o `ChangeNotifierProvider` acima dos widgets que precisam do dado e preenchendo o parametro `create` com uma funcao que recebe o contexto e retorna a instancia da classe (ex: `create: (context) => MeuEstado()`).

**3. O que é o Consumer e como ele funciona?**
E um widget que busca o estado fornecido na arvore e expoes esse dado em uma funcao de constracao (`builder`). Ele funciona aplicando a reatividade apenas no bloco de codigo envelopado por ele.

**4. Como o Consumer ajuda a reconstruir apenas os widgets que dependem do estado?**
Como ele possui um escopo delimitado, quando o estado notifica uma alteracao, apenas o metodo `builder` interno do `Consumer` e executado novamente, poupando os widgets que estao acima ou fora dele.

**5. Como posso usar o Consumer para acessar o estado fornecido pelo ChangeNotifierProvider?**
Passando o tipo do estado entre colchetes angulares (`Consumer<MeuEstado>`) e usando a instancia recebida no segundo parametro do `builder` para ler as propriedades (ex: `meuEstado.variavel`).

**6. Qual a diferença entre usar Consumer e Provider.of() para acessar o estado?**
O `Consumer` e um widget visual ideal para envelopar trechos que sofrem rebuild frequente. O `Provider.of<T>(context)` e uma chamada em linha de codigo usada para ler dados ou disparar funcoes (geralmente com `listen: false` em cliques de botao).

**7. Como posso otimizar o uso do Consumer para evitar reconstruções desnecessárias?**
Utilizando o terceiro parametro do `builder`, chamado `child`. Voce passa trechos pesados da tela que sao estaticos para o parametro `child` do `Consumer`, impedindo que eles sofram rebuild junto com os dados mutaveis.

---

## Minhas Observacoes
* o changenotifierprovider destroi automaticamente o estado da memoria quando o widget sai da arvore.
* envelopar a tela inteira com consumer anula o beneficio de reconstrucao inteligente do widget.
* o parametro child do consumer serve especificamente para otimizacao de performance de widgets estaticos.