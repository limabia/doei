

Então('deverei ver a tela entrar') do
    visit '/entrar'
end

Dado('que estou na página de cadastro de produto') do
    visit '/produtos/new'
end
Quando('preencho o drop {string} com {string}') do |string, string2|
    page.select(string2, :from => string)    
end
Quando('realizo upload no campo {string} com a foto do produto {string}') do |string, string2|
    page.attach_file string, Rails.root.join('public', 'uploads', string2)    
end
Então('ele deve ter sido salvo no banco de dados') do
produto = Produto.order("id").last
expect(produto.nome).to eq('Camiseta')
expect(produto.condicao).to eq('Usado') 
expect(produto.categoria).to eq('Roupas') 
expect(produto.tamanho).to eq('M') 
end
Então('deverei ver o produto na página de listagem de produtos') do
expect(page).to have_content('Camiseta')
expect(page).to have_content('Usado')
expect(page).to have_content('Roupas')
expect(page).to have_content('M')
end
Quando('deixo o campo {string} vazio') do |string|
fill_in string, :with => ""
end
Então('deverei ver a mensagem de erro {string}') do |string|
expect(page).to have_content(string)
end
Então('deverei ver a {string} do produto') do |string|
    expect(page).to have_content(string)
end
Então('não deverei ver a {string} do produto') do |string|
    expect(page).to have_no_content(string)
end
Quando('seleciono Já doado') do
    find(:xpath, '//option[contains(text(), "Já doado")]').select_option
end