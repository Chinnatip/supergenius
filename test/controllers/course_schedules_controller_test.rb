require 'test_helper'

class CourseSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_schedule = course_schedules(:one)
  end

  test "should get index" do
    get course_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_course_schedule_url
    assert_response :success
  end

  test "should create course_schedule" do
    assert_difference('CourseSchedule.count') do
      post course_schedules_url, params: { course_schedule: { attend_finish: @course_schedule.attend_finish, attend_reason: @course_schedule.attend_reason, attend_start: @course_schedule.attend_start, attent_hour: @course_schedule.attent_hour, course: @course_schedule.course, live_date: @course_schedule.live_date, student_id: @course_schedule.student_id } }
    end

    assert_redirected_to course_schedule_url(CourseSchedule.last)
  end

  test "should show course_schedule" do
    get course_schedule_url(@course_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_schedule_url(@course_schedule)
    assert_response :success
  end

  test "should update course_schedule" do
    patch course_schedule_url(@course_schedule), params: { course_schedule: { attend_finish: @course_schedule.attend_finish, attend_reason: @course_schedule.attend_reason, attend_start: @course_schedule.attend_start, attent_hour: @course_schedule.attent_hour, course: @course_schedule.course, live_date: @course_schedule.live_date, student_id: @course_schedule.student_id } }
    assert_redirected_to course_schedule_url(@course_schedule)
  end

  test "should destroy course_schedule" do
    assert_difference('CourseSchedule.count', -1) do
      delete course_schedule_url(@course_schedule)
    end

    assert_redirected_to course_schedules_url
  end
end
