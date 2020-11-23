class ChangeCampoRemoveNaoCurtiu < ActiveRecord::Migration[6.0]
  def change
    remove_column :feedbacks, :naocurtiu
  end
end
