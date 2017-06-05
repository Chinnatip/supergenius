class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.text :name
      t.text :surname
      t.string :major
      t.string :email
      t.integer :tel
      t.text :graduate
      t.float :gpa
      t.string :line
      t.string :facebook

      t.timestamps
    end
  end
end
