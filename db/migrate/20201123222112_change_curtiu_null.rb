class ChangeCurtiuNull < ActiveRecord::Migration[6.0]
  def change
    change_column :feedbacks, :curtiu, :integer, default: 0, null: false
  end
end
