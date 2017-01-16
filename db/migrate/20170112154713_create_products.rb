class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.text :name
      t.text :desc
      t.integer :price
      t.string :image
      t.integer :stock

      t.timestamps
    end
  end
end
