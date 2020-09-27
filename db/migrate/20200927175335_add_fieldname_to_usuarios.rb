class AddFieldnameToUsuarios < ActiveRecord::Migration[6.0]
  def change
    add_column :usuarios, :apelido, :string
  end
end
