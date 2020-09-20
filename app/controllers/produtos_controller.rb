class ProdutosController < ApplicationController
    def new         
    end
    def create
      @produto = Produto.new(produto_params) 
      @produto.save
      redirect_to @produto
    end
    def show
        @produto = Produto.find(params[:id])
    end
    
    private
    def produto_params
       params.require(:produto).permit(:nome, :situacao, :categoria, :tamanho)
    end


end
