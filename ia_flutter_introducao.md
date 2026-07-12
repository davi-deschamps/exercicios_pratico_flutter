# Atividade: Introdução ao Flutter e Widgets

## Perguntas e Interações com a IA

**1. Quais são os principais widgets do Material Design disponíveis no Flutter?**
* **Scaffold:** O "esqueleto" da tela. Ele fornece a estrutura para colocar os outros elementos (como menu e botões flutuantes).
* **AppBar:** A barra de navegação no topo do aplicativo.
* **FloatingActionButton:** O botão principal circular que geralmente fica no canto inferior.
* **ElevatedButton:** Botão de interação padrão com preenchimento e sombra.
* **Card:** Painel retangular com cantos arredondados e sombra, usado para listar itens e agrupar dados.

**2. Como o gerenciamento de estado é feito em widgets Stateful?**
É feito principalmente através do método `setState()`. Ele funciona como um gatilho: quando uma variável do aplicativo é alterada (como um número de curtidas que sobe), chamamos o `setState()` para avisar o framework. O Flutter, por sua vez, roda o método `build` novamente e redesenha a tela atualizando a informação visual para o usuário.

**3. Quais as principais diferenças entre widgets Stateless e Stateful?**
* **Stateless (Sem estado):** É imutável e estático. Uma vez desenhado na tela, ele não pode mudar sua própria aparência sozinho. Ideal para textos de títulos, ícones decorativos ou layouts fixos.
* **Stateful (Com estado):** É mutável, dinâmico e possui memória. Ele guarda variáveis e consegue se redesenhar enquanto o aplicativo está rodando. Ideal para botões interativos, animações, listas que recebem dados externos e formulários.

---

## Minhas Observações
Utilizar a IA como ferramenta de consulta deixou muito clara a mecânica principal do Flutter: tudo é um Widget, e o desempenho do app depende de saber escolher entre eles. A principal lição foi entender a separação lógica de performance: não devemos usar *Stateful* em tudo. Para interfaces fixas, o *Stateless* é mais leve e poupa processamento. A reatividade do *Stateful*, combinada com o `setState`, deve ser usada pontualmente apenas nas partes da tela que realmente vão interagir e mudar para o usuário, garantindo um código muito mais limpo e otimizado.