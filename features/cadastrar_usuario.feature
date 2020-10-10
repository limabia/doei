#language: pt

Funcionalidade: Cadastrar usuário
Como usuário da plataforma sem cadastro.
De forma que eu consiga cadastrar meu usuário na plataforma.
Eu quero ter acesso na plataforma.

Cenário: Cadastro de usuario com sucesso
Dado que estou na tela inicial
Então deverei ver o link "Cadastrar"
E clico em "Cadastrar"
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