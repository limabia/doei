class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.string :nome
      t.string :descricao
      t.string :tipo
      t.integer :curtiu
      t.integer :naocurtiu

      t.timestamps
    end
  end
end
