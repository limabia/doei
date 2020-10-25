db = SQLite3::Database.open('db/test.sqlite3')
db.results_as_hash = true
user = db.execute("Select id from 'usuarios' limit 1")
db.execute("DELETE FROM 'produtos' WHERE nome = 'camiseta teste'")
db.execute("DELETE FROM 'produtos' WHERE categoria = 'roupa masculina'")
db.execute("INSERT INTO 'produtos' (nome, categoria, tamanho, situacao, created_at, updated_at,usuario_id) VALUES ('camiseta teste', 'roupa','P','Usado', '2020-10-10', '2020-10-10', #{user[0][0]})")
db.execute("INSERT INTO 'produtos' (nome, categoria, tamanho, situacao, created_at, updated_at,usuario_id) VALUES ('camiseta', 'roupa masculina','M','Novo', '2020-10-10', '2020-10-10', #{user[0][0]})")


Dado('que estou na tela de busca') do
    visit '/sessoes/busca' 
end