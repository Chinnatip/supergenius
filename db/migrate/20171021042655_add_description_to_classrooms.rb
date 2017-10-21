class AddDescriptionToClassrooms < ActiveRecord::Migration[5.0]
  def change
    add_column :classrooms , :desc, :text
  end
end
