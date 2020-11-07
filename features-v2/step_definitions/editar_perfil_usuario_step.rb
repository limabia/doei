Então('deverei ver o perfil alterado') do
    pending # Write code here that turns the phrase above into concrete actions
  end
Então('{string} deve ter sido salvo') do |string|
    usuario = Usuario.where(email:"testa6@gmail.com").first
    expect(usuario.nome).to eq(string)        
end
Então('{string} não deve ter sido salvo') do |string|
    usuario = Usuario.where(email:"melzer.cai2o@gmail.com").first
    expect(usuario.nome).to eq(string)        
end