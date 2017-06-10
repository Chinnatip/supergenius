class ChageTeacherTostringInClassroom < ActiveRecord::Migration[5.0]
  def change
    change_column :classrooms, :teacher, :string
  end
end
