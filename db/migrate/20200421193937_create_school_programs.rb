class CreateSchoolPrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :school_programs do |t|
      t.string :name
      t.string :code
      t.text :content

      t.timestamps
    end
  end
end
