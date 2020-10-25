require 'rails_helper'
require 'spec_helper'

pass = 'mewtwo123A'
date = 121212

RSpec.describe UsuariosController do
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