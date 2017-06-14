class ChangeStudentIdToStringOfSeat < ActiveRecord::Migration[5.0]
  def change
    change_column :seats, :student , :string
  end
end
