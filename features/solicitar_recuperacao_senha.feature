#language: pt

Funcionalidade: Solicitar recuperação de senha
Como usuário registrado que não está logado
Para que eu consiga recuperar acesso ao sistema
Eu quero receber por e-mail uma forma de recadastrar a senha e recupeerar aesso

Cenário: Acessar a tela de solicitação de recuperação de senha
Dado que estou na tela de login
E clico em Esqueci minha senha
Entao deverei ver a tela de solicitação de recuperação de senha

Cenário: Solicitar recuperacao de senha para email vazio
Dado que estou na tela de solicitação de recuperação de senha
E clico em recuperar senha
Entao deverei ver a mensagem "E-mail não informado"

Cenário: Solicitar recuperacao de senha para email cadastrado
Dado que estou na tela de solicitação de recuperação de senha
Quando preecho o campo E-mail com valor válido
E clico em recuperar senha
Entao deverei ver a mensagem "Solicitação enviada com sucesso"

Cenário: Solicitar recuperacao de senha para email não cadastrado
Dado que estou na tela de solicitação de recuperação de senha
Quando preecho o campo E-mail com valor inválido
E clico em recuperar senha
Entao deverei ver a mensagem "E-mail não cadastrado"