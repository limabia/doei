class AddDetalhesToProdutos < ActiveRecord::Migration[6.0]
  def change
    add_column :produtos, :descricao, :string
    add_column :produtos, :marca, :string
    add_column :usuarios, :apelido, :string
  end
end
