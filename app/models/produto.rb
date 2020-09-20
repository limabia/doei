class Produto < ApplicationRecord
    validates :nome, presence: { message: "É obrigatório informar o nome do produto!" }
end
