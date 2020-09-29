class UsuariosController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.create(params.require(:usuario).permit(:apelido,:password))
    session[:usuario_id] = @usuario.id
    redirect_to '/home'
  end
end
