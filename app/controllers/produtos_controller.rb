class ProdutosController < ApplicationController
  skip_before_action :verify_authenticity_token
    def index  
      @produtos = Produto.order :nome
    end

    def new       
      @produto = Produto.new  
    end

    def destroy  
      @produto = Produto.find(params[:id])
      @produto.destroy

      redirect_to produtos_path
    end
    
  def create
    @produto = Produto.new(produto_params) 
    if params[:produto][:usuario_id]
      current_user.id = params[:produto][:usuario_id]
    end  
    @produto.usuario_id = current_user.id
    time = Time.now
    if params[:produto][:imagem].present?
      uploaded_io = params[:produto][:imagem]
      filename = time.strftime("%Y%m%d-%H%M%S_") + uploaded_io.original_filename
      File.open(Rails.root.join('public', 'uploads', filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      @produto.imagem = filename
    end  
    
    if @produto.save
      redirect_to produtos_path
    else
      render 'new'
    end      
  end

  def show
      @produto = Produto.find(params[:id])
  end

  def meus_produtos
    @produtos = Produto.filtro_por_usuario(session[:usuario_id])
  end 
  
  private
  def produto_params
     params.require(:produto).permit(:nome, :situacao, :categoria, :tamanho, :usuario_id)
  end
end
