require 'sqlite3'
pass =  BCrypt::Password.create('mewtwo')
db = SQLite3::Database.open('db/test.sqlite3')
db.results_as_hash = true
db.execute("DELETE FROM 'usuarios' WHERE email = 'produto@gmail.com'")
db.execute("INSERT INTO 'usuarios' (nome, password_digest, email, ativo, created_at, updated_at) VALUES ('teste inativo','#{pass}', 'produto@gmail.com',0, 121212, 121212)")
user = db.execute("Select id from 'usuarios' limit 1")
db.execute("DELETE FROM 'produtos' WHERE nome = 'camiseta teste'")
db.execute("DELETE FROM 'produtos' WHERE categoria = 'roupa masculina'")
db.execute("INSERT INTO 'produtos' (nome, categoria, tamanho, condicao, created_at, updated_at,usuario_id) VALUES ('camiseta teste', 'roupa','P','Usado', '2020-10-10', '2020-10-10', #{user[0][0]})")
db.execute("INSERT INTO 'produtos' (nome, categoria, tamanho, condicao, created_at, updated_at,usuario_id) VALUES ('camiseta', 'roupa masculina','M','Novo', '2020-10-10', '2020-10-10', #{user[0][0]})")


Dado('que estou na tela de busca') do
    visit '/sessoes/busca' 
end