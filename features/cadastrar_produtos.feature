#language: pt

Funcionalidade: Cadastrar produtos
Como usuário
Para que eu possa registrar um produto para doação
Eu quero cadastrar um produto no banco de dados


Cenário: Cadastrar produto com sucesso - campos obrigatórios
Dado que eu estou na página de cadastro de produto
Quando preencho o campo "Descricao" com "Garrafa de água"
Quando preencho o campo "Categoria" com "Objeto"
Quando preencho o campo "Estado" com "Pouco usado"
E clico em cadastrar
Então ele deve ter sido salvo no banco de dados 
E deverei ver o produto na página do produto salvo


Cenário: Cadastrar produto com sucesso - todos os campos
Dado que eu estou na página de cadastro de produto
Quando preencho o campo "Descricao" com "Garrafa de água"
Quando preencho o campo "Categoria" com "Objeto"
Quando preencho o campo "Estado" com "Pouco usado"
Quando preencho o campo "Tamanho" com "500 ml"
Quando preencho o campo "Marca" com "Sem marca"
E clico em cadastrar
Então ele deve ter sido salvo no banco de dados 
E deverei ver o produto na página do produto salvo


Cenário: Cadastrar produto com erro - sem Descrição
Dado que eu estou na página de cadastro de produto
Quando preencho o campo "Categoria" com "Objeto"
Quando preencho o campo "Estado" com "Pouco usado"
E clico em cadastrar
Então deverei ver a mensagem de erro "É obrigatório informar a descrição do produto"


Cenário: Cadastrar produto com erro - sem Categoria
Dado que eu estou na página de cadastro de produto
Quando preencho o campo "Descricao" com "Garrafa de água"
Quando preencho o campo "Estado" com "Pouco usado"
E clico em cadastrar
Então deverei ver a mensagem de erro "É obrigatório informar a categoria do produto"


Cenário: Cadastrar produto com erro - sem Estado
Dado que eu estou na página de cadastro de produto
Quando preencho o campo "Descricao" com "Garrafa de água"
Quando preencho o campo "Categoria" com "Objeto"
E clico em cadastrar
Então deverei ver a mensagem de erro "É obrigatório informar o estado do produto"
