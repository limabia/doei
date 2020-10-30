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
    describe 'deve ser cadastrado corretamente por um usuário logado' do
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
      it 'em caso de cadastro correto podemos editar' do
        @produto = Produto.create(nome:"Camiseta", situacao:"Nova", categoria:"Adulto", tamanho:"GG", imagem:"teste.jpg", usuario_id:@usuario.id)
        expect do
          patch :update, params: { nome: "Blusa", situacao: "Usada", categoria:"Adulto", tamanho:"GG", imagem:"teste.jpg", usuario_id:@usuario.id }
          expect(@produto.update params).to change(@produto) 
        end          
      end
    end
end