require 'rails_helper'
require 'spec_helper'

pass = 'mewtwo123A'
date = 121212

RSpec.describe UsuariosController, :type => :controller do 
  render_views

  describe 'registrando um usuario' do
    it 'um usuario com todos os dados e ativo' do 
      @usuario = Usuario.create({nome:"Caio Melzer", password:"mewtwo", password_confirmation:"mewtwo", email:"teste@teste.com", cpf:"371.302.628-93", dataNascimento:"16/03/1989", cep:"05754-060", telefone:"980872469", ativo:true})
      expect(@usuario).to be_valid 
    end
  end

  describe 'registrando um usuario' do
    it 'um usuario com todos os dados e inativo' do 
      @usuario = Usuario.create({nome:"Caio Melzer", password:"mewtwo", password_confirmation:"mewtwo", email:"teste@teste.com", cpf:"371.302.628-93", dataNascimento:"16/03/1989", cep:"05754-060", telefone:"980872469", ativo:false})
      expect(@usuario).to be_valid 
    end
  end

  describe 'alterar um usuário para admin' do
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
    it 'um usuario ativo que será adicionado ao grupo de admin' do 
      post :adicionar_admin, params: {id:@usuario.id}
      expect(@usuario).to be_valid 
    end
  end

  describe 'alterar um usuário para admin' do
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
    it 'um usuario ativo que será removido do grupo de admin' do 
      post :remover_admin, params: {id:@usuario.id}
      expect(@usuario).to be_valid 
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
      delete :destroy, params: { id: @usuario.id }
      @usuario.reload
      expect(session[:usuario_id]).to be_nil
    end
  end

  describe 'visualizando pagina de reativacao de conta' do 
    subject { get :reativacao_solicitacao }
    it 'usuario acessando a rota' do 
      expect(subject).to render_template("usuarios/reativacao_solicitacao")
    end
  end

  describe 'ativando a conta de usuario inativo' do 
    before { 
      @usuario = Usuario.create!(
        email:"teste@teste.com", 
        password: pass, 
        password_confirmation: pass, 
        created_at: date, 
        updated_at: date, 
        ativo: false,
      )
    }
    it 'usuario com conta inativa' do 
      post :reativacao_efetivacao, params: {email: "teste@teste.com"}
      expect(response).to render_template("usuarios/reativacao_efetivacao")
      # @emailenviado true
      expect(response.body).to  include("Usuário reativado!")
    end
  end

  describe 'ativando a conta de usuario ativo' do 
    before { 
      @usuario = Usuario.create!(
        email:"teste@teste.com", 
        password: pass, 
        password_confirmation: pass, 
        created_at: date, 
        updated_at: date, 
        ativo: true,
      )
    }
    it 'usuario com conta inativa' do
      post :reativacao_efetivacao, params: {email: "teste@teste.com"}
      expect(response).to render_template("usuarios/reativacao_efetivacao")
      # @emailenviado false
      expect(response.body).to  include("Não foi possível processar sua solicitação de reativação de conta!")
    end
  end
end