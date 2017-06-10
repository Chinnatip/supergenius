class ChageSpecTostringInClassroom < ActiveRecord::Migration[5.0]
  def change
    change_column :classrooms, :spec, :string
  end
end
