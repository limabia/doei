
Dado('que estou na tela cadastrar') do
    visit '/cadastrar' 
end

Quando('clico em Cadastrar') do
    click_on "Cadastrar"
end

Então('deverei ver a tela home') do 
    expect(page).to have_xpath('//*[@id="sair"]')
end