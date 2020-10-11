Dado('que estou na tela inicial permitida sem login') do
    visit '/sessoes/busca' 
end

Então('deverei ver o {string}') do |string|
    expect(page).to have_content(string)
end