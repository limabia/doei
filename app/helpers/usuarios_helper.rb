module UsuariosHelper
    def adicionar_admin(usuario_id)
        "usuarios/admin/#{usuario_id}/adicionar"
    end
    def remover_admin(usuario_id)
        "usuarios/admin/#{usuario_id}/remover"
    end
end
