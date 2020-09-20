require 'rails_helper'
require 'spec_helper'

RSpec.describe Produto, type: :model do
  it 'É obrigatório informar a descrição do produto' do
    produto = Produto.new
    produto.categoria = 'test categoria'
    produto.estado = 'novo'
    expect(produto).not_to be_valid
  end

  it 'É obrigatório informar a categoria do produto' do
    produto = Produto.new
    produto.descricao = 'test descrição'
    produto.estado = 'novo'
    expect(produto).not_to be_valid
  end

  it 'É obrigatório informar o estado do produto' do
    produto = Produto.new
    produto.categoria = 'test categoria'
    produto.descricao = 'test descrição'
    expect(produto).not_to be_valid
  end
end
