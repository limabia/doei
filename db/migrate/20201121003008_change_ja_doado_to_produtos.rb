class ChangeJaDoadoToProdutos < ActiveRecord::Migration[6.0]
  def change
    change_column :produtos, :ja_doado, :boolean, default: false
  end
end
