require 'rails_helper'
require 'spec_helper'

pass = 'mewtwo123A'
date = 121212

RSpec.describe ProdutosController do
    describe 'cadastrando um produto com imagem' do
        before { 
          @usuario = Usuario.create!(
            email:"teste@teste.com", 
            password: pass, 
            password_confirmation: pass, 
            created_at: date, 
            updated_at: date
          )
          session[:usuario_id] = @usuario.id
        }
            it 'can be created' do
                produto = Produto.create(nome:"Camiseta", situacao:"Nova", categoria:"Adulto", tamanho:"GG", imagem:"teste.jpg", usuario_id:@usuario.id)
            expect(produto).to be_valid
        end
    end
    describe 'cadastrando um produto sem imagem' do
        before { 
          @usuario = Usuario.create!(
            email:"teste@teste.com", 
            password: pass, 
            password_confirmation: pass, 
            created_at: date, 
            updated_at: date
          )
          session[:usuario_id] = @usuario.id
        }
            it 'can be created' do
                produto = Produto.create(nome:"Camiseta", situacao:"Nova", categoria:"Adulto", tamanho:"GG", usuario_id:@usuario.id)
            expect(produto).not_to be_valid
        end
    end
end