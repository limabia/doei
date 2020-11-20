class SessoesController < ApplicationController
   skip_before_action :authorized, only: [:new, :create, :welcome, :busca]
   include SessoesHelper

   def busca
      @categorias = Categoria.where("ativo = ?", true).map { |value| [ value.descricao, value.descricao ] }
      @categorias.insert(0, ["Todos", ""])
      @nome = params[:nomebusca]
      if @nome == nil
         @nome = params[:nome]
      end
      if @nome != nil
         @nome = @nome.downcase
      end
      @categoria = params[:categoria]
      @condicao = params[:condicao]
      @tamanho = params[:tamanho]
      @ja_doado = params[:ja_doado]

      @produtos = Produto.where(["lower(nome) like ?", "%#{@nome}%"])
      @produtos =  @produtos.where(["lower(categoria) = ?", "#{@categoria.downcase}"]) unless @categoria.blank?
      @produtos =  @produtos.where(["lower(condicao) = ?", "#{@condicao.downcase}"]) unless @condicao.blank?
      @produtos =  @produtos.where(["lower(tamanho) = ?", "#{@tamanho.downcase}"]) unless @tamanho.blank?  
      @produtos =  @produtos.where(["lower(ja_doado) = ?", "#{@ja_doado}"]) unless @ja_doado.blank?    
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

   def destroy
      #sign_out
      session.delete(:usuario_id)
      @current_user = nil
      redirect_to '/'  
   end
end