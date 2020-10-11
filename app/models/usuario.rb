class Usuario < ActiveRecord::Base
    has_secure_password
    validates :nome, presence:  false
    validates :password, presen length: { minimum: 6 }
    validates :password_confirmation, presence: true
    validates :email,
        presence: { message: "não pode ser vazio." },
        uniqueness: true,
        format: {
        with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        }    
end
