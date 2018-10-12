class AddSeatToCourseSchedule < ActiveRecord::Migration[5.0]
  def change
    add_column :course_schedules , :attend_seat, :string
  end
end
