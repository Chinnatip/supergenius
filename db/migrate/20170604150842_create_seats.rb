class CreateSeats < ActiveRecord::Migration[5.0]
  def change
    create_table :seats do |t|
      t.integer :classroom
      t.integer :student
      t.string :status
      t.integer :checkin
      t.string :valuate

      t.timestamps
    end
  end
end
