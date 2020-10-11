Então('deverei ver o perfil alterado') do
    pending # Write code here that turns the phrase above into concrete actions
  end
Então('{string} deve ter sido salvo') do |string|
    usuario = Usuario.order("id").last
    expect(usuario.nome).to eq(string)        
end