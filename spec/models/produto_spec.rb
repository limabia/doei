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
end