require 'rails_helper'
require 'spec_helper'

RSpec.describe CategoriaController do
  describe 'Cadastro de categoria:' do
        it 'criar categoria' do 
            expect do 
                post  :create, :params => { :categoria => { descricao: "roupa"} }                
                expect(categoria).to be_valid
            end
        end
        it 'falha ao criar categoria' do 
            expect do 
                post  :create, :params => { :categoria => { descricao: ""} }                
                expect(categoria).not_to be_valid
            end
        end
    end
end