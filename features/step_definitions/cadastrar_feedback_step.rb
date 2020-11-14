require 'sqlite3'
db = SQLite3::Database.open('db/test.sqlite3')
db.results_as_hash = true
db.execute("DELETE FROM 'feedbacks'")

Então('o feedback deve ter sido salvo no banco de dados com nome {string} e descricao {string}') do |nome, descricao|
    feedback = Feedback.order("id").last
    expect(feedback.nome).to eq(nome)
    expect(feedback.descricao).to eq(descricao)     
end