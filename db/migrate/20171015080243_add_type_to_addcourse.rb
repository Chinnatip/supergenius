class AddTypeToAddcourse < ActiveRecord::Migration[5.0]
  def change
    add_column :addcourses , :add_type, :string
  end
end
