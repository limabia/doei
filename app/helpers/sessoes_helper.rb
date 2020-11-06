module SessoesHelper
    def entrar(usuario)
        session[:usuario_id] = @usuario.id
    end

    def entrar_como(usuario)
        "logado #{usuario}"
    end
end
