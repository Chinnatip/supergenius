class AddCommentToSeat < ActiveRecord::Migration[5.0]
  def change
    add_column :seats, :comment, :text
  end
end
