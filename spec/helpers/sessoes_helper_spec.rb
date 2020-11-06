require 'rails_helper'
require 'spec_helper'


describe SessoesHelper, :type => :helper do
  describe "entrar" do
    before { 
      @usuario = Usuario.create!(
        email:"teste@teste.com", 
        password: 'mewtwo123A', 
        password_confirmation: 'mewtwo123A', 
        created_at: 121212, 
        updated_at: 121212
      )
    }
    it "returns user" do
      id = @usuario.id
      helper.entrar(id)
      expect(session[:usuario_id]).to  be(@usuario.id)   
    end
  end
end