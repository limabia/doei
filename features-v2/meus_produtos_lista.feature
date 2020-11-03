#language: pt

Funcionalidade: Listar meus produtos
Como doador
Para que eu consiga ver meus produtos anunciados
Eu quero acessar uma página com a listagem dos meus produtos cadastrados, contendo as informações: nome, categoria e status da doação

@doador_com_produtos
Cenário: Visualização da página com produtos cadastrados
Dado que estou logado
E estou na página Meus Produtos
Entao deverei ver a lista dos meus produtos cadastrados