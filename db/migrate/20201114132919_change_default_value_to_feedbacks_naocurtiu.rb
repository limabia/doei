class ChangeDefaultValueToFeedbacksNaocurtiu < ActiveRecord::Migration[6.0]
  def change
    change_column :feedbacks, :naocurtiu, :integer, default: 0
  end
end
