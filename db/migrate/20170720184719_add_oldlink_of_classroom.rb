class AddOldlinkOfClassroom < ActiveRecord::Migration[5.0]
  def change
    add_column :classrooms , :old_link , :string
  end
end
