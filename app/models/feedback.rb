class Feedback < ApplicationRecord
    validates :descricao, presence: { message: "O campo descricao é obrigatório!" }
end
