class ChangeSituacao < ActiveRecord::Migration[6.0]
  def change 
      rename_column :produtos, :situacao, :condicao         
  end
end
