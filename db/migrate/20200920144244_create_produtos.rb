class CreateProdutos < ActiveRecord::Migration[6.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :condicao
      t.string :categoria
      t.string :tamanho

      t.timestamps
    end
  end
end
