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
  it 'usuario tenha perfil admin' do
    usuario3 = Usuario.new   
    usuario3.email = "adm@adm.com"
    usuario3.password = pass
    usuario3.password_confirmation = pass
    usuario3.created_at = date
    usuario3.updated_at = date
    usuario3.admin = true
    expect(usuario3).to be_valid
  end
  it 'usuario não tenha perfil admin' do
    usuario4 = Usuario.new   
    usuario4.email = "notadm@adm.com"
    usuario4.password = pass
    usuario4.password_confirmation = pass
    usuario4.created_at = date
    usuario4.updated_at = date
    usuario4.admin = false
    expect(usuario4).to be_valid
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