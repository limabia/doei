require 'rails_helper'
require 'spec_helper'

RSpec.describe FeedbacksController do
  describe 'Feedback:' do
    before(:all) { 
      @feedback = Feedback.create(
        nome:"testa bruno", 
        tipo: "Elogio", 
        descricao: "testa controller metodo create"
      )
      @feedback.save
    }
        it 'feedback pode ser criado.' do 
            post  :create, :params => { :feedback => { nome: "Testa bruno2", tipo: "Reclamação", descricao:"testa controller metodo create"} }
            feedback = Feedback.create(nome: "Testa bruno2", tipo: "Reclamação", descricao:"testa controller metodo create" )
            expect(feedback).to be_valid
        end
        it 'feedback não pode criado, pois está sem descrição.' do             
            post  :create, :params => { :feedback => { nome: "Testa bruno2", tipo: "Reclamação"} }
            feedback = Feedback.create(nome: "Testa bruno2", tipo: "Reclamação" )
            expect(feedback).not_to be_valid
        end
        it 'feedback pode ser criado mesmo sem o campo nome (Anônimo).' do 
            post  :create, :params => { :feedback => { tipo: "Reclamação", descricao:"testa controller metodo create"} }
            feedback = Feedback.create(tipo: "Reclamação", descricao:"testa controller metodo create" )
            expect(feedback).to be_valid
        end
        it "Acesso ao metodo index sem autenticação." do
            get :index
            expect(response).to render_template("index")
        end
        it "Acesso ao metodo new sem autenticação e redirecionamento." do
            get :new
            expect(response.status).to eq(200)
            expect(response).to render_template("new")
        end
        it "Acesso ao metodo show sem autenticação e redirecionamento." do
            get :show, :params => { :id => @feedback}
            expect(response.status).to eq(200)
            expect(response).to render_template("show")
        end
        it "Acesso ao metodo avaliacoes para ver todas as avaliações." do
            get :avaliacoes
            expect(response.status).to eq(200)
            expect(response).to render_template("feedbacks/avaliacoes")
        end
    end
end