require 'rubygems'
require 'sqlite3'
pass =  BCrypt::Password.create('mewtwo')

db = SQLite3::Database.open('db/test.sqlite3')
db.results_as_hash = true
db.execute("DELETE FROM 'usuarios' WHERE email = 'melzer.cai2o@gmail.com'")
db.execute("INSERT INTO 'usuarios' (nome, password_digest, email, cpf, dataNascimento, cep, telefone, created_at, updated_at) VALUES ('Caio Melzer','#{pass}', 'melzer.cai2o@gmail.com','37130262893','16/03/1989','05754060','11980872469','121212','121212')")

Dado('que estou na tela inicial') do 
    visit '/'
end

Dado('que estou na tela entrar') do 
    visit '/entrar'
end

Dado('que estou na tela cadastrar') do 
    visit '/cadastrar'
end

Dado('que estou na página de cadastro de produtos') do 
    visit '/produtos'
end

Dado('deverei ver o link {string}') do |string|
    expect(page).to have_content(string)
end

Então('clico em {string}') do |string|
    click_on string
end

Quando('preencho o campo {string} com {string}') do |string, string2|
    fill_in string, :with => string2
end

Então('estarei autenticado como {string}') do |string|
    expect(sessoes.entrar_como(string)).to eq('logado caiomelzer')
end

Dado(' que devo estar na autenticado como {string}') do |string|
    expect(sessoes.entrar_como(string)).to eq('logado caiomelzer')
end

Então('deverei estar na tela home') do
    expect(page).to have_content('Sair')
end

Então('deverei ver Detalhes do produto') do
    expect(page).to have_content('Detalhes do produto')
end

Dado('que estou logado como usuario doador A') do 
    visit '/entrar'
    fill_in 'Email', :with => 'melzer.cai2o@gmail.com'
    fill_in 'password', :with => 'mewtwo'
    click_on 'Entrar'
end

E('faço o upload da imagem {string} no campo {string}') do |nome_imagem, campo| 
    attach_file(campo, Rails.root.join('features', 'upload-files', nome_imagem))
end

