class AddImagemToProdutos < ActiveRecord::Migration[6.0]
  def change
    add_column :produtos, :imagem, :string
  end
end
