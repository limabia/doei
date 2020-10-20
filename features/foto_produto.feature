#language: pt

Funcionalidade: Página de produto com a foto do item
Como um usuário.
De forma que eu consiga ver uma foto do produto.
Eu quero ver pelo menos uma foto do produto na página de produtos.

Cenário: Produto com foto no cadastro
Dado que estou na tela inicial
Então deverei ver o link "Entrar"
E clico em "Entrar"
Quando preencho o campo "Email" com "melzer.cai2o@gmail.com"
Quando preencho o campo "password" com "mewtwo"
E clico em "Entrar"
Então deverei ver o link "Sair"
Então estarei autenticado como "caiomelzer"
Então deverei ver o link "Produtos"
E clico em "Produtos"        
Então deverei ver a "Imagem" do produto