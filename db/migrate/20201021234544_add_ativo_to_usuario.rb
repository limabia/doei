class AddAtivoToUsuario < ActiveRecord::Migration[6.0]
  def change
    add_column :usuarios, :ativo, :boolean, default: true
  end
end
