#language: pt

Funcionalidade: Reativar usuário
Como usuário registrado que solicitou a reativação da conta
De forma que eu consiga recuperar meu acesso
Eu quero através de um email recebido reativar minha conta

Cenario: Ir para tela de reativacao
Dado que estou na tela inicial
Então deverei ver o texto "Entrar"
E clico em "Entrar"
Quando preencho o campo "Email" com "teste.inativo@gmail.com"
Quando preencho o campo "password" com "mewtwo"
E clico em "Entrar"
Então deverei ver o texto "Usuário inativo. Deseja reativar? Clique aqui"

# cenário de sucesso
Cenario: Reativar conta com sucesso
Dado que estou na tela de reativação de conta
Quando preencho o campo "Email" com "teste.inativo@gmail.com"
E clico em "Reativar conta"
Então deverei ver o texto "Usuário reativado!"

# cenários de falhas 
Cenário: Reativar conta ativa
Dado que estou na tela de reativação de conta
Quando preencho o campo "Email" com "teste@gmail.com"
E clico em "Reativar conta"
Então deverei ver o texto "Não foi possível processar sua solicitação de reativação de conta!"

Cenário: Reativar informando email nao cadastrado na plataforma
Dado que estou na tela de reativação de conta
Quando preencho o campo "Email" com "testenaocadastrado@teste.com"
E clico em "Reativar conta"
Então deverei ver o texto "Não foi possível processar sua solicitação de reativação de conta!"
