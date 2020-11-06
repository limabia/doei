module SessoesHelper
    def entrar(usuario)
        session[:usuario_id] = @usuario.id
    end

    def entrar_como(usuario)
        "logado #{usuario}"
    end

    # Returns true if the user is logged in, false otherwise.
    def logged_in?
        !current_user.nil?
    end
end
