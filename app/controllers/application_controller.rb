class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :current_user
    helper_method :logged_in?

    def current_user
       Usuario.find_by(id: session[:usuario_id])
    end
    def logged_in?
        !current_user.nil?
    end
    def authorized
        redirect_to '/home' unless logged_in?
    end
    include SessoesHelper
    include UsuariosHelper

end