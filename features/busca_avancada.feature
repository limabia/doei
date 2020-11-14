#language: pt

Funcionalidade: Busca Avancada
Como usuário
De forma que eu consiga encontrar um produto de acordo com seus atributos
Eu quero pesquisar produtos por nome, categoria, condição e tamanho

Cenário: Buscar Produto por Nome
Dado que estou na tela de busca
Então preencho o campo "nomebusca" com "camiseta teste"
E clico em "Buscar Produto"
Então deverei ver o texto "camiseta teste"

Cenário: Buscar Produto por Categoria
Dado que estou na tela de busca
Então preencho o campo "categoria" com "roupa masculina"
E clico em "Buscar Produto"
Então deverei ver o texto "roupa masculina"

Cenário: Buscar Produto por Tamanho
Dado que estou na tela de busca
Então preencho o campo "tamanho" com "M"
E clico em "Buscar Produto"
Então deverei ver o texto "Tamanho: M"

Cenário: Buscar Produto por condição
Dado que estou na tela de busca
Então preencho o campo "condicao" com "Usado"
E clico em "Buscar Produto"
Então deverei ver o texto "Usado"

Cenário: Buscar Produto por Nome e Categoria
Dado que estou na tela de busca
Então preencho o campo "nomebusca" com "camiseta"
E preencho o campo "categoria" com "roupa"
E clico em "Buscar Produto"
Então deverei ver o texto "camiseta"

Cenário: Produto não encontrado
Dado que estou na tela de busca
Então preencho o campo "categoria" com "inexistente"
E clico em "Buscar Produto"
Então deverei ver o texto "Nenhum produto encontrado"