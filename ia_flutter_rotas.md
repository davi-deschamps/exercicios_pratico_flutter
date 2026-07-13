# Atividade: Flutter e Rotas - Detalhes

## Perguntas e Respostas

**1. O que são rotas anônimas em Flutter e como elas funcionam?**
Sao rotas criadas de forma instatanea direto no botao de acao. Elas funcionam instanciando um `MaterialPageRoute` e passando o widget da nova tela na hora do clique, empilhando-a no `Navigator`.

**2. Quais as vantagens e desvantagens de usar rotas anônimas?**
* **Vantagem:** Facil e rapido de implementar em telas simples ou apps pequenos.
* **Desvantagem:** Espalha a navegacao pelo codigo, dificultando a manutencao e o controle dos caminhos em apps grandes.

**3. Como posso acessar os parâmetros passados em uma rota nomeada?**
Utilizando a linha de comando `ModalRoute.of(context)!.settings.arguments`. Ela extrai o objeto ou mapa enviado no `pushNamed` para que voce possa usar os dados na nova tela.

**4. Como posso tornar os parâmetros opcionais em uma rota nomeada?**
Passando um mapa (Map) ou um objeto no argumento do `pushNamed` e, na tela que recebe, tratando os valores com operadores de verificacao nula (como `??` ou `?.`) para definir um valor padrao caso venham vazios.

---

## Minhas Observacoes
* rotas anonimas nao precisam ser declaradas previamente la no materialapp.
* usar mapas como argumentos facilita passar dados opcionais ja que chaves que nao forem enviadas voltam como null.
* o modalroute so consegue ler os argumentos se a tela foi aberta por uma rota nomeada.