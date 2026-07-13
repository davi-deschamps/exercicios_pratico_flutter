# Atividade: Flutter e Widgets Básicos

## Perguntas e Respostas

**1. Quais as vantagens de usar Stack em vez de Row ou Column?**
O Stack permite empilhar widgets uns sobre os outros em camadas. Row e Column apenas alinham os itens em sequência (lado a lado ou um embaixo do outro) sem permitir sobreposição.

**2. Como posso adicionar itens dinamicamente a um ListView?**
Usando uma lista (List) no Dart para guardar os dados e atualizando a tela com o `setState` toda vez que um item for inserido ou removido dessa lista.

**3. Quais as diferenças entre ListView.builder e ListView.separated?**
O builder cria os itens conforme aparecem na tela para economizar memória. O separated faz o mesmo, mas insere obrigatoriamente um widget separador (como uma linha divisória) entre cada item.

**4. Como posso usar ListTile para criar itens de lista em um ListView?**
Passando o `ListTile` dentro do construtor da lista. Ele já vem com espaços prontos para ícone inicial (leading), titulo (title), subtitulo (subtitle) e ícone final (trailing).

---

## Minhas Observações
* row e column resolvem alinhamentos simples em linhas e colunas.
* stack e essencial para criar sobreposicoes como fotos com icones em cima.
* listview builder e a melhor opcao para desempenho ja que nao carrega a lista toda de uma vez.
* listtile deixa o design padronizado e limpo sem precisar criar containers do zero.