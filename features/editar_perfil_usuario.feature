#language: pt

Funcionalidade: Editar perfil de usuário
Como usuário da plataforma cadastrado.
De forma que eu consiga visualizar as informações do meu perfil cadastrado e possa editar .
Eu quero ter acesso ao meu perfil e editar minhas informações cadastrais.

Cenário: Editar de perfil com sucesso
Dado que estou na tela inicial
Então deverei ver o link "Entrar"
E clico em "Entrar"
Quando preencho o campo "Email" com "melzer.cai2o@gmail.com"
Quando preencho o campo "password" com "mewtwo"
E clico em "Entrar"
Então deverei ver o link "Sair"
Então estarei autenticado como "caiomelzer"
Então deverei ver o link "Perfil"
E clico em "Perfil"
Então deverei ver o link "Editar"
E clico em "Editar"
Quando preencho o campo "Nome" com "testa6"
Quando preencho o campo "Email" com "testa6@gmail.com"
Quando preencho o campo "Cep" com "01234567"
Quando preencho o campo "Cpf" com "396.372.210-00"
Quando preencho o campo "usuario[password]" com "testa6"
Quando preencho o campo "usuario[password_confirmation]" com "testa6"
Quando preencho o drop "usuario[dataNascimento(1i)]" com "1971"
Quando preencho o drop "usuario[dataNascimento(2i)]" com "July"
Quando preencho o drop "usuario[dataNascimento(3i)]" com "17"
Quando preencho o campo "Telefone" com "11551234"
E clico em "Salvar"
Então "testa6" deve ter sido salvo
Então deverei ver o link "Usuario Details"
E clico em "Voltar"