require 'rails_helper'
require 'spec_helper'

pass = 'mewtwo123A'
date = 121212

RSpec.describe Usuario, type: :model do
  before { Usuario.create!(email:"teste@teste.com", password: pass, password_confirmation: pass, created_at: date, updated_at: date)}
  it 'usuario invalido sem senha' do
    usuario = Usuario.new
    usuario.email = "teste-sem-senha@teste.com"
    usuario.created_at = date
    usuario.updated_at = date
    expect(usuario).not_to be_valid
  end
  it 'usuario invalido sem confirmacao de senha' do
    usuario = Usuario.new
    usuario.email = "teste-confirmacao-senha@teste.com"
    usuario.password = pass
    usuario.created_at = date
    usuario.updated_at = date
    expect(usuario).not_to be_valid
  end
  it 'usuario invalido sem email' do
    usuario = Usuario.new  
    usuario.password = pass
    usuario.password_confirmation = pass
    usuario.created_at = date
    usuario.updated_at = date
    expect(usuario).not_to be_valid
  end
  it 'usuario valido' do
    usuario = Usuario.new    
    usuario.email = "teste-valido@teste.com"
    usuario.created_at = date
    usuario.updated_at = date
    usuario.password = pass
    usuario.password_confirmation = pass
    expect(usuario).to be_valid
  end
  it 'usuario invalido email ja existe' do
    usuario2 = Usuario.new   
    usuario2.email = "teste@teste.com"
    usuario2.password = pass
    usuario2.password_confirmation = pass
    usuario2.created_at = date
    usuario2.updated_at = date
    expect(usuario2).not_to be_valid
  end
  it 'usuario veja a pagina com produtos' do
    produto = Produto.new    
    produto.nome = "Short"
    produto.situacao = "Usado"
    produto.categoria = "Masculino"
    produto.tamanho = "GG"
    expect(produto).not_to respond_to(:new)
  end
end