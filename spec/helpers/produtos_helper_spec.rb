require 'rails_helper'
require 'spec_helper'

describe ProdutosHelper, :type => :helper do
  before :each do
    @usuario2 = Usuario.create!(
      email:"teste@doador.com", 
      password: 'mewtwo123A', 
      password_confirmation: 'mewtwo123A', 
      created_at: 121212, 
      updated_at: 121212
    )
    session[:usuario_id] = @usuario2.id
    @produto = Produto.create(nome: 'Camiseta', condicao: 'Nova', categoria: 'Adulto', tamanho: 'GG', imagem: 'teste.jpg', usuario_id: @usuario2.id)
    @usuario = Usuario.create!(
      email:"teste@teste.com", 
      password: 'mewtwo123A', 
      password_confirmation: 'mewtwo123A', 
      created_at: 121212, 
      updated_at: 121212
    )
    session[:usuario_id] = @usuario.id
  end
  describe "retornar dados" do
    it "de email" do
      helper.retornar_dados_doador(@usuario2.id,'email')
      expect(helper.retornar_dados_doador(@usuario2.id,'email')).to eql("teste@doador.com")   
    end
    it "de telefone se tiver" do
      @usuario2.update({telefone:"5511980872469"})
      @usuario2.reload
      helper.retornar_dados_doador(@usuario2.id,'telefone')
      expect(helper.retornar_dados_doador(@usuario2.id,'telefone')).to eql("5511980872469")   
    end
    it "de telefone, se tiver, fica nulo" do
      helper.retornar_dados_doador(@usuario2.id,'telefone')
      expect(helper.retornar_dados_doador(@usuario2.id,'telefone')).to eql(nil)   
    end
  end
end