class CreateCourseSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :course_schedules do |t|
      t.string :student_id
      t.string :course
      t.datetime :live_date
      t.datetime :attend_start
      t.datetime :attend_finish
      t.string :attent_hour
      t.string :attend_reason

      t.timestamps
    end
  end
end
