class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.text :name
      t.string :major
      t.float :price
      t.integer :grade
      t.integer :seat

      t.timestamps
    end
  end
end
