#language: pt

Funcionalidade: Busca sem login
Como usuário não cadastrado ou logado
Para que eu posso ralizar busca de produtos sem login
Eu quero buscar um produto no banco de dados sem precisar logar


Cenário: Realizar uma busca sem login
Dado que estou na tela inicial
Então preencho o campo "nome" com "camiseta"
E clico em "Buscar"
Então deverei ver o link "Resultado da busca"