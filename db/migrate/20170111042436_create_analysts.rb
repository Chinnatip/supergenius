class CreateAnalysts < ActiveRecord::Migration[5.0]
  def change
    create_table :analysts do |t|
      t.string :company
      t.string :name
      t.string :tel
      t.string :email

      t.timestamps
    end
  end
end
