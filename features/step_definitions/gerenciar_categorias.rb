
Dado('que estou na tela de Cadastro de categoria') do
    visit '/categoria/new'
end

Então('deverei ver a categoria {string}') do |string|
    expect(page).to have_content(string)
end


Então('deverei ir para lista de categorias') do 
    expect(page).to have_current_path(categoria_path)
end
