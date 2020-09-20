class Produto < ApplicationRecord
    validates :descricao, presence: { message: "É obrigatório informar a descrição do produto" }
    validates :estado, presence: { message: "É obrigatório informar o estado do produto" }
    validates :categoria, presence: { message: "É obrigatório informar a categoria do produto" }
end
