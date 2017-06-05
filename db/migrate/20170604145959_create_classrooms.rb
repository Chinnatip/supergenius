class CreateClassrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :classrooms do |t|
      t.text :name
      t.integer :spec
      t.integer :course
      t.integer :teacher
      t.integer :seat
      t.integer :booked
      t.integer :pass
      t.string :status
      t.integer :schedule
      t.datetime :start
      t.datetime :end
      t.float :price
      t.time :start_time
      t.time :end_time
      t.integer :duration

      t.timestamps
    end
  end
end
