class ChangeCurrentOfClassrooms < ActiveRecord::Migration[5.0]
  def change
    change_column :classrooms , :current, :string
  end
end
