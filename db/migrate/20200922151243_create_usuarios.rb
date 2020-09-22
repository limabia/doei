class CreateUsuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :password_digest
      t.string :email
      t.string :cpf
      t.date :dataNascimento
      t.string :cep
      t.string :telefone

      t.timestamps
    end
    add_index :usuarios, :email, unique: true
  end
end
