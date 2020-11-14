#language: pt

Funcionalidade: Editar produto
Como doador
Para que eu consiga alterar um produto cadastrado
Eu quero conseguir visualizar o produto cadastrado e realizar alterações nas informações cadastradas

Cenário: Editar produto
Dado que estou na tela inicial
Então deverei ver o link "Entrar"
E clico em "Entrar"
Quando preencho o campo "Email" com "melzer.cai2o@gmail.com"
Quando preencho o campo "password" com "mewtwo"
E clico em "Entrar"
Então deverei ver o link "Sair"
Então estarei autenticado como "caiomelzer"
Dado que estou na página de cadastro de produto
Quando preencho o campo "Nome" com "Camiseta"
Quando preencho o campo "Condicao" com "Usado"
Quando preencho o campo "Categoria" com "Adulto"
Quando preencho o campo "Tamanho" com "M"
Quando realizo upload no campo "Imagem" com a foto do produto "no-image.png"
E clico em "Salvar"
Então ele deve ter sido salvo no banco de dados
E deverei ver o produto na página de listagem de produtos
E clico no primeiro "Detalhes"
Então deverei ver o link "Editar"
E clico em "Editar"
Então deverei ver a mensagem "Editar Produto"
Quando preencho o campo "Nome" com "Camisa listrada"
Quando preencho o campo "Tamanho" com "G"
E clico em "Editar"
Então deverei ver a mensagem "Camisa listrada"