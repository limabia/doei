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
  it 'Curtir o feedback com nome' do
    feedback = Feedback.new
    feedback.nome = "Bruno Emílio"
    feedback.tipo = "Elogio"    
    feedback.descricao = "teste de feedback (curtiu) model."
    feedback.curtiu += 1 
    expect(feedback).to be_valid
  end
  it 'Curtir o feedback sem nome (anônimo)' do
    feedback = Feedback.new    
    feedback.tipo = "Elogio"    
    feedback.descricao = "teste de feedback (curtiu) model."
    feedback.curtiu += 1 
    expect(feedback).to be_valid
  end
  it 'Curtir o feedback tipo reclamação' do
    feedback = Feedback.new
    feedback.nome = "bruno"
    feedback.tipo = "Reclamação" 
    feedback.curtiu += 1    
    feedback.descricao = "teste de feedback (curtiu) model."
    expect(feedback).to be_valid
  end
  it 'Curtir o feedback sem descrição inválido' do
    feedback = Feedback.new
    feedback.nome = "teste"
    feedback.tipo = "Elogio" 
    feedback.curtiu += 1      
    expect(feedback).not_to be_valid
  end
  it 'Curtir o feedback com descrição' do
    feedback = Feedback.new
    feedback.nome = "teste bruno"
    feedback.tipo = "Elogio"    
    feedback.descricao = "teste de feedback (curtiu) model."
    expect(feedback).to be_valid
  end
  it 'Remover o feedback sem nome (anônimo)' do
    feedback = Feedback.new    
    feedback.tipo = "Elogio"    
    feedback.descricao = "teste de feedback (remover)"
    feedback.curtiu += 1 
    expect(feedback).to be_valid
    feedback.destroy
    expect(feedback).to be_valid
  end
  it 'Remover o feedback tipo reclamação' do
    feedback = Feedback.new
    feedback.nome = "bruno"
    feedback.tipo = "Reclamação" 
    feedback.curtiu += 1    
    feedback.descricao = "teste de feedback (remover)"
    expect(feedback).to be_valid
    feedback.destroy
    expect(feedback).to be_valid
  end
  it 'Remover o feedback sem descrição inválido' do
    feedback = Feedback.new
    feedback.nome = "teste"
    feedback.tipo = "Elogio" 
    feedback.curtiu += 1      
    expect(feedback).not_to be_valid
    feedback.destroy
    expect(feedback).not_to be_valid
  end
end