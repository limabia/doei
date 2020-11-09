
Dado('que estou na tela de login') do
    visit "/entrar"
end
  
Dado('clico em Esqueci minha senha') do
    click_on "Esqueci minha senha"
end
  
Entao('deverei ver a tela de solicitação de recuperação de senha') do
    expect(page).to have_content("Recuperação de senha")
end
  
Dado('que estou na tela de solicitação de recuperação de senha') do
    visit "/recuperar_senha"
end
  
Quando('preecho o campo E-mail com valor válido') do
    usuario = Usuario.order('id').last
    fill_in 'email', :with => usuario.email
end

Quando('preecho o campo E-mail com valor inválido') do
    fill_in 'email', :with => "sem_email@teste.com"
end
  
Quando('clico em recuperar senha') do
    click_on "Recuperar Senha"
end
  
Quando('preecho o campo E-mail com valor não válido') do
    fill_in Email, :with => 'sem_cadastro@teste.com'
end