class CreateSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :schools do |t|
      t.text :name
      t.integer :student
      t.integer :graduated

      t.timestamps
    end
  end
end
