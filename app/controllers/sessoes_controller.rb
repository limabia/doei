class SessoesController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  def new
  end
  def login
  end
  def create
     @usuario = Usuario.find_by(apelido: params[:apelido])
     if @usuario && @usuario.authenticate(params[:password])
        session[:usuario_id] = @usuario.id
        redirect_to '/home'
     else
        redirect_to '/entrar'
     end
  end
  def page_requires_login
  end
  def destroy
   #sign_out
      session.delete(:usuario_id)
      @current_user = nil
      redirect_to '/'  
   end

end