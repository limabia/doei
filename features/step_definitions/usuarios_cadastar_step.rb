Dado('que estou na página de cadastro de usuario') do
    visit '/usuarios/new'
end

Quando('clico em salvar usuario') do
    click_on "Salvar"
end

Então('o usuario {string} com o email {string} deve ter sido salvo') do |nome_usuario, email_usuario|   
    usuario = Usuario.order("id").last
    expect(usuario.nome).to eq(nome_usuario)
    expect(usuario.email).to eq(email_usuario)
    usuario.destroy
end

# Então('deverei ver a mensagem de erro {string}') do |mensagem|
#     expect(page).to have_content(mensagem)
# end 