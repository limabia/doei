require 'rails_helper'
require 'spec_helper'
RSpec.describe Produto, type: :model do
  it 'invalido sem nome' do
    produto = Produto.new
    produto.situacao = "Novo"
    produto.categoria = "Infantil"
    produto.tamanho = "P"
    expect(produto).not_to be_valid
  end
  it 'invalido sem a situacao' do
    produto = Produto.new    
    produto.categoria = "Infantil"
    produto.tamanho = "P"
    expect(produto).not_to be_valid
  end
  it 'invalido sem a imagem do produto' do
    produto = Produto.new    
    produto.nome = "Camisa"
    produto.situacao = "Usado"
    produto.categoria = "Infantil"
    produto.tamanho = "P"
    expect(produto).not_to be_valid
  end
  it 'nao eh valido apertar em detalhes se o produto nao foi cadastrado corretamente' do
    produto = Produto.new    
    produto.nome = "Short"
    produto.situacao = "Usado"
    produto.categoria = "Masculino"
    produto.tamanho = "GG"
    expect(produto).not_to respond_to(:show)
  end   
end