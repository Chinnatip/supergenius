class ChageSlassroomToStringInSeat < ActiveRecord::Migration[5.0]
  def change
    change_column :seats, :classroom, :string
  end
end
