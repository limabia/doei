Dado('que estou na tela inicial') do 
    visit '/'
end

Dado('que estou na tela entrar') do 
    visit '/entrar'
end

Dado('que estou na tela cadastrar') do 
    visit '/cadastrar'
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

Então('deverei estar na autenticado') do
    UsuariosHelper.entrar
end

Então('deverei estar na tela home') do
    expect(page).to have_content('Sair')
end