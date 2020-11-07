#language: pt

Funcionalidade: Cadastrar usuarios
Como Usuario
Para que eu possa me registrar na plataforma
Eu quero me cadastrar como novo usuário

Cenário: Cadastro de usuario com sucesso
Dado que estou na página de cadastro de usuario
Quando preencho o campo "Nome" com "Teste Novo Usuario"
Quando preencho o campo "usuario[password]" com "123456"
Quando preencho o campo "usuario[password_confirmation]" com "123456"
Quando preencho o campo "cadastrar_form_email" com "email@usuario.com"
E clico em salvar usuario
Então o usuario "Teste Novo Usuario" com o email "email@usuario.com" deve ter sido salvo

Cenário: Cadastro de usuario com erro
Dado que estou na página de cadastro de usuario
Quando clico em salvar usuario
E deverei ver a mensagem de erro "Email não pode ser vazio"

Cenário: Cadastro de usuario com erro de confirmacao de senha
Dado que estou na página de cadastro de usuario
Quando preencho o campo "Nome" com "Novo Usuario"
Quando preencho o campo "usuario[password]" com "senha123"
Quando preencho o campo "usuario[password_confirmation]" com "senha_diferente"
Quando preencho o campo "cadastrar_form_email" com "email@usuario.com"
E clico em salvar usuario
E deverei ver a mensagem de erro "Password confirmation doesn't match confirmation"