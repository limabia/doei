require 'rails_helper'
require 'spec_helper'


describe SessoesHelper, :type => :helper do
  before :each do
    @usuario = Usuario.create!(
      email:"teste@teste.com", 
      password: 'mewtwo123A', 
      password_confirmation: 'mewtwo123A', 
      created_at: 121212, 
      updated_at: 121212
    )
  end
  describe "entrar" do
    it "coloca usuario na sessao" do
      id = @usuario.id
      helper.entrar(id)
      expect(session[:usuario_id]).to  be(@usuario.id)   
    end
  end
  describe "entrar como" do 
    before do 
      session[:usuario_id] = @usuario.id
    end
    it "retorna usuario da sessao" do
      @usuario = Usuario.find_by(id: session[:usuario_id])
      saida = helper.entrar_como(@usuario)
      expect(saida).to eq("logado #{@usuario}")
    end
  end
end