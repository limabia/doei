require 'rails_helper'
require 'spec_helper'

pass = 'mewtwo123A'
date = 121212

RSpec.describe ProdutosController, :type => :controller do
  render_views
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
          @produto.update({nome: "Blusa", situacao: "Usada", categoria:"Adulto", tamanho:"GG", imagem:"teste.jpg", usuario_id:@usuario.id })
          @produto.reload
        end.to change{@produto.nome}.from("Camiseta").to("Blusa")
      end
    end

    describe 'cadastrar produto e ver a página de editar' do
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
      it 'usuario logado cadastra produto e quer ver a página de editar' do
        @produto = Produto.create(nome:"Camiseta", situacao:"Nova", categoria:"Adulto", tamanho:"GG", imagem:"teste.jpg", usuario_id:@usuario.id)
        expect(@produto.id).to eql(1)      
      end
    end
    
    describe 'nao deve ser cadastrado corretamente por um usuário logado' do
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
      it 'em caso de cadastro correto não podemos editar se deixar campo vazio' do
        @produto = Produto.create(nome:"Camiseta", situacao:"Nova", categoria:"Adulto", tamanho:"GG", imagem:"teste.jpg", usuario_id:@usuario.id)
        @produto.update({nome: "", situacao: "Usada", categoria:"Adulto", tamanho:"GG", imagem:"teste.jpg", usuario_id:@usuario.id })
        @produto.reload
        expect(@produto.nome).to eql("Camiseta")
      end
    end

    describe 'deletar produto' do
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
      it 'um usuário logado pode deletar o produto cadastrado.' do
        @produto = Produto.create(nome:"Camiseta", situacao:"Nova", categoria:"Adulto", tamanho:"GG", imagem:"teste.jpg", usuario_id:@usuario.id)
        @produto.destroy
        expect(Produto.count).to eql(0) 
      end
    end
end