class SessoesController < ApplicationController
   skip_before_action :authorized, only: [:new, :create, :welcome, :busca]
   include SessoesHelper

   def new
   end
   def login
   end
   def busca
      @nome = params[:nomebusca]
      if @nome == nil
         @nome = params[:nome]
      end
      if @nome != nil
         @nome = @nome.downcase
      end
      @categoria = params[:categoria]
      @situacao = params[:situacao]
      @tamanho = params[:tamanho]
      @produtos = Produto.where(["lower(nome) like ?", "%#{@nome}%"])
      @produtos =  @produtos.where(["lower(categoria) = ?", "#{@categoria.downcase}"]) unless @categoria.blank?
      @produtos =  @produtos.where(["lower(situacao) = ?", "#{@situacao.downcase}"]) unless @situacao.blank?
      @produtos =  @produtos.where(["lower(tamanho) = ?", "#{@tamanho.downcase}"]) unless @tamanho.blank?      
      respond_to do |format|         
         format.html { render :busca }
      end
      
   end
   def create      
      @usuario = Usuario.find_by(email: params[:email])
      if @usuario && @usuario.authenticate(params[:password])
         entrar @usuario
         redirect_to '/'
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