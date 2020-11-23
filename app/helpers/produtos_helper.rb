module ProdutosHelper
    def retornar_dados_doador(id, dado)
        @usuario = Usuario.find_by(id: id)
        case dado 
        when 'telefone'
           @usuario.telefone
        when 'email'
            @usuario.email
        else
          ""
        end
    end
end
