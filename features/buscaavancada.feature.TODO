#language: pt

Funcionalidade: Busca Avancada
Como usuário
De forma que eu consiga encontrar um produto de acordo com seus atributos
Eu quero pesquisar produtos por nome, categoria, situação e tamanho

Cenário: Buscar Produto por Nome
Dado que estou na tela de busca
Então preencho o campo "nome" com "camiseta"
E clico em "Buscar"
Então deverei ver o "camiseta"

Cenário: Buscar Produto por Categoria
Dado que estou na tela de busca
Então preencho o campo "categoria" com "roupa"
E clico em "Buscar"
Então deverei ver o "roupa"

Cenário: Buscar Produto por Tamanho
Dado que estou na tela de busca
Então preencho o campo "tamanho" com "M"
E clico em "Buscar"
Então deverei ver o "M"

Cenário: Buscar Produto por situação
Dado que estou na tela de busca
Então preencho o campo "situacao" com "Usado"
E clico em "Buscar"
Então deverei ver o "Usado"

Cenário: Buscar Produto por Nome e Categoria
Dado que estou na tela de busca
Então preencho o campo "nome" com "camiseta"
E preencho o campo "categoria" com "roupa"
E clico em "Buscar"
Então deverei ver o "camiseta"

Cenário: Produto não encontrado
Dado que estou na tela de busca
Então preencho o campo "categoria" com "inexistente"
E clico em "Buscar"
Então deverei ver o "Nenhum produto encontrado"