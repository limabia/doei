
Dado('que estou na página inicial') do
    visit '/' 
end

Então('deverei ver o link {string}') do |string|
    expect(page).to have_content(string)
end

Quando('clico em Entrar') do
    click_on "Entrar"
end

Então('deverei ver a tela de login') do
    expect(page).to have_content("Entrar")
end