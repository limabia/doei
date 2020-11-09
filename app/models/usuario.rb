class Usuario < ActiveRecord::Base
    has_secure_password
    validates :nome, presence:  false
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true
    validates :email,
        presence: { message: "não pode ser vazio." },
        uniqueness: true,
        format: {
        with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

        }    

    def gerar_token
        self.reset_password_token = SecureRandom.hex(10)
        self.reset_password_sent_at = Time.now.utc
        save(validate: false)
    end
end
