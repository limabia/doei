class AddDetalhesToProdutos < ActiveRecord::Migration[6.0]
  def change
    add_column :produtos, :descricao, :string
    add_column :produtos, :marca, :string
  end
end
