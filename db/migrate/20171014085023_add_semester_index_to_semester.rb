class AddSemesterIndexToSemester < ActiveRecord::Migration[5.0]
  def change
    add_column :semesters , :sem_index , :string
  end
end
