require 'rails_helper'
require 'spec_helper'

pass = 'mewtwo123A'
date = 121212

RSpec.describe UsuariosController do
  describe 'registrando um usuario' do
    it 'um usuario com todos os dados e ativo' do 
      expect do 
        post :create, params: {nome:"Caio Melzer", password:"mewtwo", password_confirmation:"mewtwo", email:"melzer.caio@gmail.com", cpf:"371.302.628-93", dataNascimento:"16/03/1989", cep:"05754-060", telefone:"980872469", ativo:true}
        expect(@usuario).to be_valid 
      end
    end
  end
  describe 'registrando um usuario' do
    it 'um usuario com todos os dados e inativo' do 
      expect do 
        post :create, params: {nome:"Caio Melzer", password:"mewtwo", password_confirmation:"mewtwo", email:"melzer.caio@gmail.com", cpf:"371.302.628-93", dataNascimento:"16/03/1989", cep:"05754-060", telefone:"980872469", ativo:false}
        expect(@usuario).to be_valid 
      end
    end
  end

  describe 'alterar um usuário para admin' do
    it 'um usuario ativo que será adicionado ao grupo de admin' do 
      expect do 
        post :adicionar_admin, params: {id:0}
        expect(@usuario).to be_valid 
      end
    end
  end

  describe 'alterar um usuário para admin' do
    it 'um usuario ativo que será removido do grupo de admin' do 
      expect do 
        post :remover_admin, params: {id:0}
        expect(@usuario).to be_valid 
      end
    end
  end

  describe 'registrando um usuario' do
    it 'um usuario com todos os dados e inativo' do 
      expect do 
        post :create, params: {nome:"Caio Melzer", password:"mewtwo", password_confirmation:"mewtwo", email:"melzer.caio@gmail.com", cpf:"371.302.628-93", dataNascimento:"16/03/1989", cep:"05754-060", telefone:"980872469", ativo:false}
        expect(@usuario).to be_valid 
      end
    end
  end

  describe 'destivando usuario autenticado' do
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
    it 'um usuario logado quer desativar a conta' do 
      expect do 
        delete :destroy, params: { id: @usuario.id }
        @usuario.reload
      end.to change{@usuario.ativo}.from(true).to(false)
      expect(session[:usuario_id]).to be_nil
    end
  end
    describe 'destivando usuario não autenticado' do
      before { 
        @usuario = Usuario.create!(
          email:"teste@teste.com", 
          password: pass, 
          password_confirmation: pass, 
          created_at: date, 
          updated_at: date
        )
      }
    it 'um usuario nao logado quer desativar a conta' do 
      expect do 
        delete :destroy, params: { id: @usuario.id }
        @usuario.reload
      end
      expect(session[:usuario_id]).to be_nil
    end
  end
end