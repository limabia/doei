#language: pt

Funcionalidade: Como um usuário
De forma que eu consiga acessar a página de produto a partir da listagem de produtos
Eu quero clicar em um link na listagem de produtos que me leva para a página do produto em questão

Cenário: Entrar na página de um produto específico com o botão detalhes
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
Quando preencho o campo "Situacao" com "Usado"
Quando preencho o campo "Categoria" com "Adulto"
Quando preencho o campo "Tamanho" com "M"
Quando realizo upload no campo "Imagem" com a foto do produto "no-image.png"
E clico em "Salvar"
Então ele deve ter sido salvo no banco de dados
E deverei ver o produto na página de listagem de produtos
E clico no primeiro "Detalhes"
Então deverei ver Detalhes do produto
