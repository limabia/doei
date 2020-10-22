class SessoesController < ApplicationController
   skip_before_action :authorized, only: [:new, :create, :welcome, :busca]
   include SessoesHelper

   def new
   end

   def login
   end
   
   def busca
      @nome = params[:nome]
      @categoria = params[:categoria]
      @situacao = params[:situacao]
      @tamanho = params[:tamanho]
      @produtos = Produto.where(["nome like ?", "%#{@nome}%"])
      @produtos =  @produtos.where(["categoria = ?", "#{@categoria}"]) unless @categoria.blank?
      @produtos =  @produtos.where(["situacao = ?", "#{@situacao}"]) unless @situacao.blank?
      @produtos =  @produtos.where(["tamanho = ?", "#{@tamanho}"]) unless @tamanho.blank?      
      respond_to do |format|         
         format.html { render :busca }
      end
      
   end
   
   def create      
      @usuario = Usuario.find_by(email: params[:email])
      if @usuario && @usuario.ativo == false
         @inactiveuser = true;
         respond_to do |format|
            format.html { render :new }
         end
      elsif @usuario && @usuario.authenticate(params[:password])
         entrar @usuario
         redirect_to '/'
      else
         @faillogin = true;
         respond_to do |format|
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