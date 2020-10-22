class Produto < ApplicationRecord  
    validates :nome, presence: { message: "É obrigatório informar o nome do produto!" }
    validates :situacao, presence: { message: "É obrigatório informar a situação do produto!" }

    scope :filtro_por_usuario, -> (usuario) {where usuario_id: usuario}
end
