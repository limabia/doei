#language: pt

Funcionalidade: Cadastrar usuarios
Como administrador
Para que eu possa registrar os usuarios
Eu quero cadastrar um usuario no banco de dados

Cenário: Cadastro de usuario com sucesso
Dado que estou na página de cadastro de usuario
Quando preencho o campo "Nome" com "Renato"
Quando preencho o campo "usuario[password]" com "123456"
Quando preencho o campo "usuario[password_confirmation]" com "123456"
Quando preencho o drop "usuario_dataNascimento_1i" com "1984"
Quando preencho o campo "Email" com "r@c.com"
Quando preencho o campo "Cpf" com "123.123.123-98"
E clico em salvar usuario
Então ele deve ter sido salvo
E deverei ver o usuario na página de listagem de usuarios

Cenário: Cadastro de usuario com erro
Dado que estou na página de cadastro de usuario
E clico em salvar usuario
Então deverei ver a mensagem de erro "Nome não pode ser vazio"
E deverei ver a mensagem de erro "Email não pode ser vazio"
E deverei ver a mensagem de erro "Email é invalido"
