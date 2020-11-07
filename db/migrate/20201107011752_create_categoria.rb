class CreateCategoria < ActiveRecord::Migration[6.0]
  def change
    create_table :categoria do |t|
      t.string :descricao
      t.boolean :ativo

      t.timestamps
    end
  end
end
