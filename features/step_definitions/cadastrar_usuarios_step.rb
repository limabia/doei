  Dado('que estou na página de cadastro de usuario') do
    visit '/usuarios/new'
  end
  Quando('clico em salvar usuario') do
    click_on "Salvar"
  end
  Então('ele deve ter sido salvo') do
    usuario = Usuario.order("id").last
    expect(usuario.nome).to eq('Renato')
    expect(usuario.email).to eq('r@c.com')
  end
  Então('deverei ver o usuario na página de listagem de usuarios') do
    visit '/usuarios'
    expect(page).to have_content('Renato')
    expect(page).to have_content('r@c.com')
  end