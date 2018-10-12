class AddStaffCodeToCoureSchedule < ActiveRecord::Migration[5.0]
  def change
    add_column :course_schedules , :ref_code, :string
  end
end
