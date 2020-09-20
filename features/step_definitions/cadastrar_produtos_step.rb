  Dado('que estou na página de cadastro de produto') do
    visit '/produtos/new'
  end
  Quando('preencho o campo {string} com {string}') do |string, string2|
    fill_in string, :with => string2
  end
  Quando('clico em salvar') do
    click_on "Salvar novo produto"
  end
  Então('ele deve ter sido salvo no banco de dados') do
    produto = Produto.order("id").last
    expect(produto.nome).to eq('Camiseta')
    expect(produto.situacao).to eq('Usado') 
    expect(produto.categoria).to eq('Adulto') 
    expect(produto.tamanho).to eq('M') 
  end
  Então('deverei ver o produto na página de listagem de produtos') do
    expect(page).to have_content('Camiseta')
    expect(page).to have_content('Usado')
    expect(page).to have_content('Adulto')
    expect(page).to have_content('M')
  end