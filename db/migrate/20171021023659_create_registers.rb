class CreateRegisters < ActiveRecord::Migration[5.0]
  def change
    create_table :registers do |t|
      t.string :course
      t.string :student

      t.timestamps
    end
  end
end
