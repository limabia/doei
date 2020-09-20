class ProdutosController < ApplicationController
    def new       
        @produto = Produto.new  
    end
    def create
      @produto = Produto.new(produto_params) 

      if @produto.save
        redirect_to @produto
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
