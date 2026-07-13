# Atividade: Flutter e Formulários - Validações

## Perguntas e Respostas

**1. Qual a diferença entre um TextField e um TextFormField?**
O `TextField` e o campo de texto basico e isolado. O `TextFormField` e uma versao que ja vem com suporte nativo para funcionar dentro do widget `Form`, facilitando a validacao e o salvamento dos dados em grupo.

**2. Qual a diferença entre validação síncrona e assíncrona?**
A síncrona acontece na hora, testando o texto localmente com regras rapidas (ex: ver se o campo esta vazio). A assíncrona precisa esperar uma resposta externa que demora um tempo (ex: consultar um banco de dados na internet para ver se o usuario ja existe).

**3. O que significa validar um campo de texto em Flutter?**
Significa rodar uma funcao de teste para checar se o texto digitado pelo usuario cumpre as regras do aplicativo (ex: conferir se o e-mail digitado tem o simbolo `@`) antes de deixar o formulario ser enviado.

---

## Minhas Observacoes
* textformfield economiza codigo porque ja mostra a mensagem de erro vermelha embaixo dele sozinho.
* validacao sincrona e instantanea e roda direto no aparelho do usuario.
* o metodo validate() do form avisa todos os campos para rodarem suas validacoes ao mesmo tempo.