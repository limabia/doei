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

Então('estarei autenticado como {string}') do |string|
    expect(sessoes.entrar_como(string)).to eq('logado caiomelzer')
end

Dado(' que devo estar na autenticado como {string}') do |string|
    expect(sessoes.entrar_como(string)).to eq('logado caiomelzer')
end

Então('deverei estar na tela home') do
    expect(page).to have_content('Sair')
end