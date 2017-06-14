class AddPeriodToClassroom < ActiveRecord::Migration[5.0]
  def change
    add_column :classrooms , :period , :integer 
  end
end
