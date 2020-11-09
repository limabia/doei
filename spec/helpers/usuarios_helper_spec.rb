require 'rails_helper'
require 'spec_helper'

describe UsuariosHelper, :type => :helper do
  before {
    @usuario = Usuario.create!(
      email:"teste@teste.com", 
      password: 'mewtwo123A', 
      password_confirmation: 'mewtwo123A', 
      created_at: 121212, 
      updated_at: 121212
    )
 }
 it "retornar path para adicionar usuario com admin" do
    id = @usuario.id
    helper.adicionar_admin(id)
    expect(helper.adicionar_admin(id)).to  eql("usuarios/admin/#{id}/adicionar")   
  end
  it "retornar path para remover usuario com admin" do
    id = @usuario.id
    helper.remover_admin(id)
    expect(helper.remover_admin (id)).to  eql("usuarios/admin/#{id}/remover")   
  end
end