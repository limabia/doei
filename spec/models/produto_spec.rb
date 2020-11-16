require 'rails_helper'
require 'spec_helper'

pass = 'mewtwo123A'
date = 121212

RSpec.describe Produto, type: :model do
  it 'invalido sem nome' do
    produto = Produto.new
    produto.condicao = "Novo"
    produto.categoria = "Roupas"
    produto.tamanho = "P"
    expect(produto).not_to be_valid
  end
  it 'invalido sem a condicao' do
    produto = Produto.new    
    produto.categoria = "Roupas"
    produto.tamanho = "P"
    expect(produto).not_to be_valid
  end
  it 'invalido sem a imagem do produto' do
    produto = Produto.new    
    produto.nome = "Camisa"
    produto.condicao = "Usado"
    produto.categoria = "Roupas"
    produto.tamanho = "P"
    expect(produto).not_to be_valid
  end
  it 'nao eh valido apertar em detalhes se o produto nao foi cadastrado corretamente' do
    produto = Produto.new    
    produto.nome = "Short"
    produto.condicao = "Usado"
    produto.categoria = "Masculino"
    produto.tamanho = "GG"
    expect(produto).not_to respond_to(:show)
  end 
  it 'editar nao existe produto por erro no cadastro' do
    produto = Produto.new    
    produto.nome = "Short"
    produto.condicao = "Usado"
    produto.categoria = "Masculino"
    produto.tamanho = "GG"
    expect(produto).not_to respond_to(:edit)
  end
end