class ChangeFeedbacksCurtiuNull < ActiveRecord::Migration[6.0]
  def change
    change_column :feedbacks, :curtiu, :integer
  end
end
