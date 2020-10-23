
Before("@doador_com_produtos") do
    visit("/cadastrar")
    fill_in 'Nome', :with => "Usuário de teste"
    fill_in 'usuario[email]', :with => "usuario@teste.com"
    fill_in 'usuario[password]', :with => "senha123"
    fill_in 'usuario[password_confirmation]', :with => "senha123"
    click_on 'Salvar'

    usuario = Usuario.order('id').last

    produto = Produto.new
    produto.nome = "Produto 1"
    produto.situacao = "Usada"
    produto.categoria = "Roupas"
    produto.tamanho = "M"
    produto.imagem = "no-image.png"
    produto.usuario_id = usuario.id
    produto.save
    
    produto = Produto.new
    produto.nome = "Produto 2"
    produto.situacao = "Usada"
    produto.categoria = "Roupas"
    produto.tamanho = "44"
    produto.imagem = "no-image.png"
    produto.usuario_id = usuario.id
    produto.save
end

Dado('que estou logado') do
    visit("/entrar")
    fill_in 'Email', :with => "usuario@teste.com"
    fill_in 'password', :with => "senha123"
    click_on 'Entrar' 
    expect(page).to have_xpath('//*[@id="sair"]')
end
  
Dado('estou na página Meus Produtos') do
    usuario = Usuario.order('id').last
    visit("produtos/meus_produtos/#{usuario.id}")    
end
  
Entao('deverei ver a mensagem {string}') do |mensagem|
    expect(page).to have_content(mensagem)
end
  
Entao('deverei ver a lista dos meus produtos cadastrados') do    
    expect(page).to have_content('Produto 1')
    expect(page).to have_content('Produto 2')
end