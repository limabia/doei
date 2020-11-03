Então('ele deve ter sido salvo usuario') do
    usuario = Usuario.order("id").last
    expect(usuario.nome).to eq('testa6')
    expect(usuario.email).to eq('testa6@gmail.com') 
    expect(usuario.cpf).to eq('396.372.210-00')     
end