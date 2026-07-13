# Atividade: Flutter e Internacionalização (i18n) - Conceitos

## Perguntas e Respostas

**1. O que é internacionalização e o qual sua importância?**
É o processo de construir e adaptar o aplicativo para suportar múltiplos idiomas e culturas. Sua importância está em expandir o público global do app, garantindo que o usuário tenha uma experiência acessível e natural em sua língua materna.

**2. Como funciona a internacionalização no Flutter?**
Ela funciona substituindo textos fixos no código por variáveis que buscam o texto correto em arquivos de dicionário, dependendo do idioma configurado no celular do usuário. O Flutter gera automaticamente as classes necessárias para acessar esses textos de forma segura.

**3. Quais as dicas de uso dos arquivos ARB?**
Mantenha um padrão de nomenclatura claro para as chaves (ex: `telaLogin_botaoEntrar`), nunca deixe valores vazios e utilize o prefixo `@` (como `@telaLogin_botaoEntrar`) para inserir descrições de contexto que ajudam os tradutores a entender onde o texto será usado.

**4. Quais cuidados devo ter ao usar o INTL?**
O principal cuidado é evitar a concatenação manual de palavras com variáveis, pois a estrutura das frases muda entre idiomas. Use os "placeholders" do INTL. Além disso, garanta que nenhuma chave de texto esteja faltando em traduções de idiomas secundários.

**5. Como posso adicionar suporte para diferentes idiomas em meu aplicativo Flutter?**
Adicionando os pacotes `flutter_localizations` e `intl` nas dependências, ativando `generate: true` no `pubspec.yaml`, criando a pasta `l10n` com os arquivos `.arb` e configurando os parâmetros de localização no widget `MaterialApp`.

---

## Minhas Observacoes
* arquivos arb funcionam de forma parecida com o json mas sao focados na traducao do app.
* a opcao generate no pubspec avisa o flutter para criar as classes de traducao sozinho.
* alem dos textos o intl tambem formata valores como moedas e datas conforme a regiao do usuario.
* concatenar palavras fixas quebra a traducao pois a ordem das palavras muda de um pais para o outro.