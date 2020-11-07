require 'rails_helper'
require 'spec_helper'

RSpec.describe CategoriaController, type: :controller do
  describe 'Cadastro de categoria:' do
    context 'GET #index' do 
       it 'deve entrar na listagem' do
           get(:index) 
           expect(response).to have_http_status(200)
           expect(response).to render_template :index
        end
       end
       it 'deve entrar na tela de nova categoria' do
        get(:new) 
        expect(response).to have_http_status(200)
        expect(response).to render_template :new
        end
        it 'deve criar nova categoria quando dados corretos' do 
            expect { post(:create, params: { :categoria => { descricao: "teste"} }) }.to change(Categoria, :count).by(1)            
        end
        it 'deve falhar ao criar nova categoria quando descricao vazia' do 
            expect { post(:create, params: { :categoria => { descricao: ""} }) }.to change(Categoria, :count).by(0)            
        end
    end
    describe 'Edicao de categoria:' do 
        it 'deve criar nova categoria quando dados corretos' do 
            categoria = Categoria.create(
                descricao:"teste"              
            )
            patch :update, params: { id: categoria.id,  :categoria => { descricao: "testeedit"} }
            categoria.reload
            expect(categoria.descricao).to eq "testeedit"
        end
        it 'deve falhar ao criar editar categoria quando descricao vazia' do 
            categoria = Categoria.create(
                descricao:"teste"              
            )
            patch :update, params: { id: categoria.id,  :categoria => { descricao: ""} }
            categoria.reload
            expect(categoria.descricao).to eq "teste"
        end
    end
end