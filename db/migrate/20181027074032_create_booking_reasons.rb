class CreateBookingReasons < ActiveRecord::Migration[5.0]
  def change
    create_table :booking_reasons do |t|
      t.string :reason
      t.string :ref_code

      t.timestamps
    end
  end
end
