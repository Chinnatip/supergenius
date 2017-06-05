class CreateExams < ActiveRecord::Migration[5.0]
  def change
    create_table :exams do |t|
      t.integer :ref_class
      t.integer :student
      t.integer :issue
      t.integer :score

      t.timestamps
    end
  end
end
