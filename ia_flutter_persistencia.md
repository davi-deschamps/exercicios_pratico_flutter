# Atividade: Flutter e Persistência de Dados (Conceitos)

## Perguntas e Respostas

**1. Quais são os diferentes tipos de dados que podem ser persistidos em um aplicativo Flutter?**
Podem ser persistidos dados primitivos (textos, numeros, booleanos), arquivos fisicos (imagens, documentos) e dados estruturados complexos (usando bancos de dados locais como SQLite ou Hive).

**2. O que é o pacote SharedPreferences em Flutter e como ele funciona?**
E uma biblioteca que permite salvar dados simples no formato de "chave-valor" diretamente no armazenamento nativo do celular. Ele funciona de forma assincrona, lendo e gravando informacoes leves no disco.

**3. Quando devo usar SharedPreferences em vez de outras opções de persistência de dados?**
Deve ser usado apenas para configuracoes leves e estados simples do app, como preferencia de idioma, modo claro/escuro ou para guardar um token de autenticação basico.

---

## Minhas Observacoes
* shared preferences usa o padrao de chave e valor para salvar os dados.
* nao e indicado para salvar arquivos grandes listas complexas ou senhas sem criptografia.
* serve perfeitamente para guardar configuracoes rapidas e pequenas do usuario.