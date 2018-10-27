class CreateBookingWeeks < ActiveRecord::Migration[5.0]
  def change
    create_table :booking_weeks do |t|
      t.string :week
      t.string :title

      t.timestamps
    end
  end
end
