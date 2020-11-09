
Dado('que estou na tela de reativação de conta') do
    visit '/reativacao_solicitacao'
end

Então('deveria clicar em {string}') do |link|
    click_on  {link}
  end
  
Então('ser redirecionado para a tela de reativação de conta') do
    redirect_to "/reativacao_solicitacao"
end
  