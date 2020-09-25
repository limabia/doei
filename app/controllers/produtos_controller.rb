class ProdutosController < ApplicationController
    def index   
      @produtos = Produto.order :nome
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
        u.cpf = '647.249.980-24'
        u.dataNascimento = '2000-10-10'
        u.cep = '03590080'
        u.telefone = '11987678976'
        u.password = 'secret123456'
        u.save
      else 
        u = Usuario.first
      end
      # retirar esse trecho quando tiver criação de usuários e login funcionando
      @produto.usuario_id = u.id
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
