class CreateAddcourses < ActiveRecord::Migration[5.0]
  def change
    create_table :addcourses do |t|
      t.string :type
      t.string :course
      t.text :desc

      t.timestamps
    end
  end
end
