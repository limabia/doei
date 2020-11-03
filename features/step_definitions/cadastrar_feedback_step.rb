Então('o feedback deve ter sido salvo no banco de dados com nome {string} e descricao {string}') do |nome, descricao|
    feedback = Feedback.order("id").last
    expect(feedback.nome).to eq(nome)
    expect(feedback.descricao).to eq(descricao)     
end