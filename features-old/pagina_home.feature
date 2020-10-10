#language: pt

Funcionalidade: Pagina Home
Como usuário
Para interagir com o site
Eu quero acessar a página inicial

Cenário: Visualizar página inicial
Dado que estou na página inicial
Então deverei ver o link "Quero Doar"
E deverei ver o link "Quero Doação"
E deverei ver o link "Entrar"

Cenário: Logar no sistema
Dado que estou na página inicial
Quando clico em Entrar
Então deverei ver a tela de login
Quando preencho o campo "Email" com "melzer.cai2o@gmail.com"
Quando preencho o campo "password" com "mewtwo"
E clico em Entrar


