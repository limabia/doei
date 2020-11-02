require 'rails_helper'
require 'spec_helper'

RSpec.describe Feedback, type: :model do
  it 'Cadastro de feedback sem descrição inválido' do
    feedback = Feedback.new
    feedback.nome = "teste"
    feedback.tipo = "Elogio"    
    expect(feedback).not_to be_valid
  end
  it 'Cadastro de feedback com descrição' do
    feedback = Feedback.new
    feedback.nome = "teste bruno"
    feedback.tipo = "Elogio"    
    feedback.descricao = "teste de feedback model."
    expect(feedback).to be_valid
  end
  it 'Cadastro de feedback tipo reclamação' do
    feedback = Feedback.new
    feedback.nome = "bruno"
    feedback.tipo = "Reclamação"    
    feedback.descricao = "teste de feedback model."
    expect(feedback).to be_valid
  end
  it 'Cadastro de feedback tipo elogio' do
    feedback = Feedback.new
    feedback.nome = "Bruno Emílio"
    feedback.tipo = "Elogio"    
    feedback.descricao = "teste de feedback model."
    expect(feedback).to be_valid
  end
  it 'Cadastro de feedback sem nome (anônimo)' do
    feedback = Feedback.new
    feedback.nome = "Bruno Emílio"
    feedback.tipo = "Elogio"    
    feedback.descricao = "teste de feedback model."
    expect(feedback).to be_valid
  end
end