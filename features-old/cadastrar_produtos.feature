#language: pt

Funcionalidade: Cadastrar produtos
Como usuário
Para que eu possa registrar os produtos disponiveis para doacao
Eu quero cadastrar um produto no banco de dados

Cenário: Cadastro de produto com sucesso
Dado que estou na página inicial
Quando clico em Entrar
Então deverei ver a tela de login
Quando preencho o campo "Apelido" com "caiomelzer"
Quando preencho o campo "Password" com "mewtwo"
Dado que estou na página de cadastro de produto
Quando preencho o campo "Nome" com "Camiseta"
Quando preencho o campo "Situacao" com "Usado"
Quando preencho o campo "Categoria" com "Adulto"
Quando preencho o campo "Tamanho" com "M"
E clico em salvar
Então ele deve ter sido salvo no banco de dados
E deverei ver o produto na página de listagem de produtos

Cenário: Cadastro de produto com erro - sem nome
Dado que estou na página de cadastro de produto
Quando preencho o campo "Situacao" com "Novo"
Quando preencho o campo "Categoria" com "Infantil"
Quando preencho o campo "Tamanho" com "P"
E deixo o campo "Nome" vazio
E clico em salvar
Então deverei ver a mensagem de erro "É obrigatório informar o nome do produto!"

Cenário: Cadastro de produto com erro - sem situacao
Dado que estou na página de cadastro de produto
Quando preencho o campo "Categoria" com "Infantil"
Quando preencho o campo "Tamanho" com "P"
E deixo o campo "Nome" vazio
E deixo o campo "Situacao" vazio
E clico em salvar
Então deverei ver a mensagem de erro "É obrigatório informar a situação do produto!"