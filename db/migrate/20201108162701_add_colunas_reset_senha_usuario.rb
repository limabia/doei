class AddColunasResetSenhaUsuario < ActiveRecord::Migration[6.0]
  def change
    add_column :usuarios, :reset_password_token, :string
    add_column :usuarios, :reset_password_sent_at, :datetime
  end
end
