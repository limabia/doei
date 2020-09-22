class AddUsuarioRefToProdutos < ActiveRecord::Migration[6.0]
  def change
    add_reference :produtos, :usuario, null: false, foreign_key: true
  end
end
