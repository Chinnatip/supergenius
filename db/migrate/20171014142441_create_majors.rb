class CreateMajors < ActiveRecord::Migration[5.0]
  def change
    create_table :majors do |t|
      t.string :name
      t.string :major_id
      t.string :major_code

      t.timestamps
    end
  end
end
