require 'rubygems'
require 'sqlite3'
pass =  BCrypt::Password.create('mewtwo')

db = SQLite3::Database.open('db/test.sqlite3')
db.results_as_hash = true
db.execute("DELETE FROM 'categoria' WHERE descricao = 'Roupas'")
db.execute("INSERT INTO  'categoria' (descricao,ativo, created_at, updated_at) VALUES ('Roupas', 1, '123','123')")
db.execute("DELETE FROM 'usuarios' WHERE email = 'melzer.cai2o@gmail.com'")
db.execute("INSERT INTO 'usuarios' (nome, password_digest, email, cpf, dataNascimento, cep, telefone, created_at, updated_at, ativo) VALUES ('Caio Melzer','#{pass}', 'melzer.cai2o@gmail.com','37130262893','16/03/1989','05754060','5511980872469','121212','121212', 1)")
db.execute("DELETE FROM 'usuarios' WHERE email = 'teste.inativo@gmail.com'")
db.execute("INSERT INTO 'usuarios' (nome, password_digest, email, ativo, created_at, updated_at) VALUES ('teste inativo','#{pass}', 'teste.inativo@gmail.com',0, 121212, 121212)")
db.execute("DELETE FROM 'usuarios' WHERE email = 'teste@teste.com'")
db.execute("INSERT INTO 'usuarios' (nome, password_digest, email, ativo, created_at, updated_at) VALUES ('teste','#{pass}', 'teste@teste.com',1, 121212, 121212)")
db.execute("DELETE FROM 'usuarios' WHERE email = 'adm@adm.com'")
db.execute("INSERT INTO 'usuarios' (nome, password_digest, email, ativo, admin, created_at, updated_at) VALUES ('teste','#{pass}', 'adm@adm.com',1, 1, 121212, 121212)")
db.execute("DELETE FROM 'usuarios' WHERE email = 'notadm@adm.com'")
db.execute("INSERT INTO 'usuarios' (nome, password_digest, email, ativo, admin, created_at, updated_at) VALUES ('teste','#{pass}', 'notadm@adm.com',1, 0, 121212, 121212)")

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

Então('deverei ver o logo da plataforma') do 
    expect(page).to have_xpath("//img[@src=\"/assets/logo-6dee06922906c019e04646a2f5292ad5bb6740ad708fbae5cdd0a1687ebc6781.png\"]")
end


Dado('deverei ver o texto {string}') do |string|
    expect(page).to have_content(string)
end

Então('clico em {string}') do |string|
    click_on string
end

Então('clico no primeiro {string}') do |string|
    first("input[value='#{string}']").click
end

Então('clico no primeiro link {string}') do |string|
    first("a", :text => string).click
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

Dado('que estou logado como usuario A') do 
    visit '/entrar'
    fill_in 'Email', :with => 'melzer.cai2o@gmail.com'
    fill_in 'password', :with => 'mewtwo'
    click_on 'Entrar'
end

Dado('que estou logado como usuario') do 
    visit '/entrar'
    fill_in 'Email', :with => 'teste@teste.com'
    fill_in 'password', :with => 'mewtwo'
    click_on 'Entrar'
end

E('faço o upload da imagem {string} no campo {string}') do |nome_imagem, campo| 
    attach_file(campo, Rails.root.join('features', 'upload-files', nome_imagem))
end

Dado('que sou um visitante') do
    visit '/'
end

Quando('acesso a página inicial') do
    visit '/'
    expect(page).to have_content('Entrar')
end

Dado('que estou logado como usuario administrador') do
    visit '/entrar'
    fill_in 'Email', :with => 'adm@adm.com'
    fill_in 'password', :with => 'mewtwo'
    click_on 'Entrar'
end

Dado('que estou na página de lista de usuários') do
    visit '/usuarios'
end

Dado('seleciono o usuário do {string} {string}') do |string, string2|
    pending # Write code here that turns the phrase above into concrete actions
end

Quando('clico em {string} na lista {string}, na linha onde {string} com valor {string}') do |string, string2, string3, string4|
    within(:xpath, "//tr[.//*[contains(text(), '#{string4}')]]") do
        click_on 'Tornar Admin'
    end
end

Então('o atributo {string}, que é {string} no usuário {string} deve estar como {string}') do |string, string2, string3, string4|
    usuario = Usuario.where(email:string3).first
    case string2
        when "boolean"
            if string4 = "true"
                string4 = true
            else
                string4 = false
            end        
    end
    expect(usuario[string]).to eq(string4) 
end    


Então('deverei acessar a página de um produto onde o doador tem {string}') do |string|
    visit '/entrar'
    fill_in 'Email', :with => 'melzer.cai2o@gmail.com'
    fill_in 'password', :with => 'mewtwo'
    click_on 'Entrar'
    visit '/produtos/new'
    usuario = Usuario.order('id').last
    fill_in 'Nome', :with => 'teste'
    page.select('Novo', :from =>  'produto[condicao]') 
    page.select('Roupas', :from =>  'produto[categoria]') 
    fill_in 'Tamanho', :with => 'G'
    attach_file('Imagem', Rails.root.join('features', 'upload-files', 'test_ok_png.png'))
    click_on 'Salvar'
    click_on 'Sair'
    visit '/entrar'
    fill_in 'Email', :with => 'teste@teste.com'
    fill_in 'password', :with => 'mewtwo'
    click_on 'Entrar'
    produto = Produto.order('id').last
    visit '/produtos/'+produto.id.to_s
end

Então('deverei acessar a página de um produto onde o doador não tem {string}') do |string|
    visit '/entrar'
    fill_in 'Email', :with => 'teste@teste.com'
    fill_in 'password', :with => 'mewtwo'
    click_on 'Entrar'
    visit '/produtos/new'
    usuario = Usuario.order('id').last
    fill_in 'Nome', :with => 'teste'
    page.select('Novo', :from =>  'produto[condicao]') 
    page.select('Roupas', :from =>  'produto[categoria]') 
    fill_in 'Tamanho', :with => 'G'
    attach_file('Imagem', Rails.root.join('features', 'upload-files', 'test_ok_png.png'))
    click_on 'Salvar'
    click_on 'Sair'
    visit '/entrar'
    fill_in 'Email', :with => 'melzer.cai2o@gmail.com'
    fill_in 'password', :with => 'mewtwo'
    click_on 'Entrar'
    produto = Produto.order('id').last
    visit '/produtos/'+produto.id.to_s
end

Então('não deverei ver o link {string}') do |string|
    expect(page).to have_no_content(string)
end

Então('deverei acessar a página {string}') do |string|
    visit '/produtos/new'
    usuario = Usuario.order('id').last
    fill_in 'Nome', :with => 'teste'
    page.select('Novo', :from =>  'produto[condicao]') 
    page.select('Roupas', :from =>  'produto[categoria]') 
    fill_in 'Tamanho', :with => 'G'
    attach_file('Imagem', Rails.root.join('features', 'upload-files', 'test_ok_png.png'))
    click_on 'Salvar'
    visit '/produtos'
end


Então('deverei clicar no link {string}') do |string|
    find(".btn-danger", match: :first).click
    #page.accept_confirm { click_button "Remover" }
end



