class CreateProdutos < ActiveRecord::Migration[6.0]
  def change
    create_table :produtos do |t|
      t.string :descricao
      t.string :categoria
      t.string :estado
      t.string :tamanho
      t.string :marca
      t.datetime :data_criacao
      t.datetime :data_atualizacao

      t.timestamps
    end
  end
end
