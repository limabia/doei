  Dado('que eu estou na página de cadastro de produto') do
    visit '/produtos/new'
  end
  
  Quando('preencho o campo {string} com {string}') do |string, string2|
    fill_in string,	:with => string2
  end
  
  Quando('clico em cadastrar') do
    click_on 'Cadastrar'
  end
  
  Então('ele deve ter sido salvo no banco de dados') do
    produto = Produto.order("id").last
    expect(produto.descricao).to eq("Garrafa de água") 
    expect(produto.categoria).to eq("Objeto")
    expect(produto.estado).to eq("Pouco usado") 
  end
  
  Então('deverei ver o produto na página do produto salvo') do
    expect(page).to have_content('Garrafa de água')
  end
  
  Então('deverei ver a mensagem de erro {string}') do |string|
    expect(page).to have_content(string)
  end
