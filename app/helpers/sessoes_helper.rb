module SessoesHelper
    def entrar(usuario)
        session[:usuario_id] = usuario.id
    end

    # Returns the current logged-in user (if any).
    def current_user
        @current_user ||= User.find_by(id: session[:usuario_id])
    end

    def entrar_como(usuario)
        "logado #{usuario}"
    end

    # Returns true if the user is logged in, false otherwise.
    def logged_in?
        !current_user.nil?
    end

    # Confirms a logged-in user or redirect
    def logged_in_user                
        if !logged_in?
            flash[:danger] = "Please log in."
            redirect_to login_url
        end
    end
end
