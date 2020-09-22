class ProdutosController < ApplicationController
    def index   
        @produto = Produto.new      
        render 'new'
    end

    def new       
        @produto = Produto.new  
    end

    def create
      @produto = Produto.new(produto_params) 
      # TODO pegar da session o usuario
      if not Usuario.exists?
        u = Usuario.new
        u.nome = 'user teste'
        u.email = 'user@teste.com'
        u.cpf = '123456789'
        u.dataNascimento = '2010-10-10'
        u.cep = '03590080'
        u.telefone = '11987678976'
        u.save
      else 
        u = Usuario.first
      end
      # retirar esse trecho quando tiver criação de usuários e login funcionando
      @produto.usuario_id = u.id
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
