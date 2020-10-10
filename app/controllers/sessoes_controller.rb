class SessoesController < ApplicationController
   skip_before_action :authorized, only: [:new, :create, :welcome]
   include SessoesHelper

   def new
   end
   def login
   end
   def create      
      @usuario = Usuario.find_by(email: params[:email])
      if @usuario && @usuario.authenticate(params[:password])
         entrar @usuario
         redirect_to '/home'
      else
         respond_to do |format|
         @faillogin = true;
         format.html { render :new }
         end
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