class AddSemesterCodeToSemester < ActiveRecord::Migration[5.0]
  def change
    add_column :semesters , :sem_code , :string
  end
end
