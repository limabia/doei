Dado('que estou na tela inicial permitida sem login') do
    visit '/sessoes/busca' 
end

E('clico em Buscar') do
    click_on "Buscar"
end

Então('deverei ver o resultado da busca') do
    expect(page).to have_content("Resultado")
end