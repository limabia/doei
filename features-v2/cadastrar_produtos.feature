#language: pt

Funcionalidade: Cadastrar produtos
Como usuário
Para que eu possa registrar os produtos disponiveis para doacao
Eu quero cadastrar um produto no banco de dados

Cenário: Cadastro de produto com sucesso
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

Cenário: Cadastro de produto com erro - sem nome
Dado que estou na tela inicial
Então deverei ver o link "Entrar"
E clico em "Entrar"
Quando preencho o campo "Email" com "melzer.cai2o@gmail.com"
Quando preencho o campo "password" com "mewtwo"
E clico em "Entrar"
Então deverei ver o link "Sair"
Então estarei autenticado como "caiomelzer"
Dado que estou na página de cadastro de produto
Quando preencho o campo "Condicao" com "Novo"
Quando preencho o campo "Categoria" com "Infantil"
Quando preencho o campo "Tamanho" com "P"
E deixo o campo "Nome" vazio
E clico em "Salvar"
Então deverei ver a mensagem de erro "É obrigatório informar o nome do produto!"

Cenário: Cadastro de produto com erro - sem condicao
Dado que estou na tela inicial
Então deverei ver o link "Entrar"
E clico em "Entrar"
Quando preencho o campo "Email" com "melzer.cai2o@gmail.com"
Quando preencho o campo "password" com "mewtwo"
E clico em "Entrar"
Então deverei ver o link "Sair"
Então estarei autenticado como "caiomelzer"
Dado que estou na página de cadastro de produto
Quando preencho o campo "Categoria" com "Infantil"
Quando preencho o campo "Tamanho" com "P"
E deixo o campo "Nome" vazio
E deixo o campo "Condicao" vazio
E clico em "Salvar"
Então deverei ver a mensagem de erro "É obrigatório informar a condição do produto!"

Cenário: Cadastro de produto com imagem jpg com sucesso
Dado que estou logado como usuario doador A
E que estou na página de cadastro de produto
Quando preencho o campo "Nome" com "Camiseta"
E preencho o campo "Condicao" com "Usado"
E preencho o campo "Categoria" com "Adulto"
E preencho o campo "Tamanho" com "M"
E faço o upload da imagem "test_ok_jpg.jpg" no campo "Imagem"
E clico em "Salvar"
Então ele deve ter sido salvo no banco de dados
E deverei ver o produto na página de listagem de produtos

Cenário: Cadastro de produto com imagem png com sucesso
Dado que estou logado como usuario doador A
E que estou na página de cadastro de produto
Quando preencho o campo "Nome" com "Camiseta"
E preencho o campo "Condicao" com "Usado"
E preencho o campo "Categoria" com "Adulto"
E preencho o campo "Tamanho" com "M"
E faço o upload da imagem "test_ok_png.png" no campo "Imagem"
E clico em "Salvar"
Então ele deve ter sido salvo no banco de dados
E deverei ver o produto na página de listagem de produtos