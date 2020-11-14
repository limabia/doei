class Produtos < ActiveRecord::Migration[6.0]
  def change
    add_column :produtos, :ja_doado, :string, default: "Não"
  end
end
