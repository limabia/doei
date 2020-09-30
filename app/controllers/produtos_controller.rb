class ProdutosController < ApplicationController
    def index   
      @produtos = Produto.order :nome
    end

    def new       
        @produto = Produto.new  
    end

    def create
      @produto = Produto.new(produto_params) 
      #@produto.usuario_id = session[:usuario_id]
      if @produto.save
        redirect_to produtos_path
      else
        render 'new'
      end      
    end

    def show
        @produto = Produto.find(params[:id])
    end
    
    private
    def produto_params
       params.require(:produto).permit(:nome, :situacao, :categoria, :tamanho)
    end
end
