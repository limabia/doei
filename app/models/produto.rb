class Produto < ApplicationRecord
    validates :nome, presence: { message: "É obrigatório informar o nome do produto!" }
    validates :situacao, presence: { message: "É obrigatório informar a situação do produto!" }
end
