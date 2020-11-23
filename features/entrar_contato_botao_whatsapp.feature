#language: pt

Funcionalidade: Como um usuário
De forma que eu consiga entrar em contato via whatsapp com o doador
Eu quero ver na pagina de produto um botão para enviar uma mensagem via whatsapp para o doador

Cenário: Entrar na página de um produto específico e ver botão de enviar uma mensagem via whatsapp 
Dado que estou logado como usuario A
Então deverei acessar a página de um produto onde o doador tem 'telefone'
E deverei ver o link "Enviar Whatsapp"

Cenário: Entrar na página de um produto específico e não ver botão de enviar uma mensagem via whatsapp 
Dado que estou logado como usuario
Então deverei acessar a página de um produto onde o doador não tem 'telefone'
E não deverei ver o link "Enviar Whatsapp"