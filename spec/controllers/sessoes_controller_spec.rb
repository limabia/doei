require 'rails_helper'
require 'spec_helper'

pass = 'mewtwo123A'
date = 121_212

RSpec.describe SessoesController, :type => :controller do 
  render_views

  describe 'busca avançada' do
    before do
      @usuario = Usuario.create!(
        email: 'teste@teste.com',
        password: pass,
        password_confirmation: pass,
        created_at: date,
        updated_at: date
      )
      @produto1 = Produto.create!(
        nome: 'Camiseta', 
        condicao: 'Nova', 
        categoria: 'Adulto', 
        tamanho: 'GG', 
        imagem: 'teste.jpg', 
        usuario_id: @usuario.id
      )
      @produto2 = Produto.create!(
        nome: 'Camiseta', 
        condicao: 'Nova', 
        categoria: 'Adulto', 
        tamanho: 'GG', 
        imagem: 'teste.jpg', 
        usuario_id: @usuario.id, 
        ja_doado: true
      )
    end
    it 'todos produtos' do 
      get(:busca) 
      expect(response).to have_http_status(200)
      expect(response).to render_template :busca
      expect(assigns(:produtos).count).to eq(2) 
    end
    it 'produtos doados' do 
      get(:busca, params: { :ja_doado => 1 }) 
      expect(response).to have_http_status(200)
      expect(response).to render_template :busca
      expect(assigns(:produtos).where(:ja_doado => 1).count).to eq(1) 
      expect(assigns(:produtos).where(:ja_doado => 0).count).to eq(0) 

    end
    it 'produtos nao doados' do 
      get(:busca, params: { :ja_doado => 0 }) 
      expect(response).to have_http_status(200)
      expect(response).to render_template :busca
      expect(assigns(:produtos).where(:ja_doado => 1).count).to eq(0) 
      expect(assigns(:produtos).where(:ja_doado => 0).count).to eq(1)
    end
  end
end