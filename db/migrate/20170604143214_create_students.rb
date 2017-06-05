class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.text :name
      t.text :surname
      t.integer :grade
      t.text :school
      t.text :parent
      t.string :email
      t.integer :tel
      t.string :line
      t.string :facebook

      t.timestamps
    end
  end
end
