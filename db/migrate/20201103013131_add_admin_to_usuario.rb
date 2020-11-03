class AddAdminToUsuario < ActiveRecord::Migration[6.0]
  def change
    add_column :usuarios, :admin, :boolean
  end
end
