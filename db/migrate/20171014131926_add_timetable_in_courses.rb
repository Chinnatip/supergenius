class AddTimetableInCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses , :time_table , :string
  end
end
