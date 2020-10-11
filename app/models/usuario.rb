class Usuario < ActiveRecord::Base
    has_secure_password
    validates :nome, presence:  true
    validates :password, length: { minimum: 6}, presence: { message: "É obrigatório informar a senha correta para relizar alteração." }    
    validates :email,
        presence: true,
        uniqueness: true,
        format: {
        with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        }
    validates :cpf,
        presence: true,
        uniqueness: true,
        format: {
        with: /\d{3}\.\d{3}\.\d{3}\-\d{2}\z/i
        } 
    validate :age_greater_than_18?
    def age_greater_than_18?
      if dataNascimento.present? && dataNascimento > Date.today - 18.years
        errors.add(:dataNascimento, "Deve ser maior de 18 anos")
      end
    end    
end
