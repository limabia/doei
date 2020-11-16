#language: pt

Funcionalidade: Gerenciar Categorias
Como um Administrador
De forma que eu consiga restringir as categorias existentes
Eu quero poder inserir uma categoria com os atributos nome e ativo

Cenário: Cadastro de categoria com sucesso
Dado que estou na tela inicial
Então deverei ver o link "Entrar"
E clico em "Entrar"
Quando preencho o campo "Email" com "melzer.cai2o@gmail.com"
Quando preencho o campo "password" com "mewtwo"
E clico em "Entrar"
Dado que estou na tela de Cadastro de categoria
Quando preencho o campo "categoria[descricao]" com "categoria teste"
E clico em "Salvar"
Então deverei ir para lista de categorias
E deverei ver a categoria "categoria teste"
Quando clico no primeiro link "Editar"
E preencho o campo "categoria[descricao]" com ""
E clico em "Salvar"
Então deverei ver a mensagem de erro "O campo descricao é obrigatório!"
Quando preencho o campo "categoria[descricao]" com "editada"
E clico em "Salvar"
Então deverei ir para lista de categorias
E deverei ver a categoria "editada"
 
Cenário: Cadastro de categoria com falha
Dado que estou na tela inicial
Então deverei ver o link "Entrar"
E clico em "Entrar"
Quando preencho o campo "Email" com "melzer.cai2o@gmail.com"
Quando preencho o campo "password" com "mewtwo"
E clico em "Entrar"
Dado que estou na tela de Cadastro de categoria
E clico em "Salvar"
Então deverei ver a mensagem de erro "O campo descricao é obrigatório!"
