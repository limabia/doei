
Dado('que estou na tela entrar') do
    visit '/entrar' 
end

E('clico em Entrar') do
    click_on "Entrar"
end

Então('deverei ver a tela home') do 
    expect(page).to have_xpath('//*[@id="sair"]')
end
