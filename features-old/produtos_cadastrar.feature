#language: pt

Funcionalidade: Cadastrar produtos
Como usuário
Para que eu possa registrar os produtos disponiveis para doacao
Preciso estar logado
Eu quero cadastrar um produto no banco de dados

Cenário: Cadastro de produto com sucesso
Dado que estou na página inicial
Quando clico em Entrar
Então deverei ver a tela entrar
Quando preencho o campo "Email" com "melzer.cai2o@gmail.com"
Quando preencho o campo "password" com "mewtwo"
Dado que estou na página de cadastro de produto
Quando preencho o campo "Nome" com "Camiseta"
Quando preencho o campo "Situacao" com "Usado"
Quando preencho o campo "Categoria" com "Adulto"
Quando preencho o campo "Tamanho" com "M"
E clico em salvar
Então ele deve ter sido salvo no banco de dados
E deverei ver o produto na página de listagem de produtos
