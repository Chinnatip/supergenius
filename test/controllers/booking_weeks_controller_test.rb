require 'test_helper'

class BookingWeeksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_week = booking_weeks(:one)
  end

  test "should get index" do
    get booking_weeks_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_week_url
    assert_response :success
  end

  test "should create booking_week" do
    assert_difference('BookingWeek.count') do
      post booking_weeks_url, params: { booking_week: { title: @booking_week.title, week: @booking_week.week } }
    end

    assert_redirected_to booking_week_url(BookingWeek.last)
  end

  test "should show booking_week" do
    get booking_week_url(@booking_week)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_week_url(@booking_week)
    assert_response :success
  end

  test "should update booking_week" do
    patch booking_week_url(@booking_week), params: { booking_week: { title: @booking_week.title, week: @booking_week.week } }
    assert_redirected_to booking_week_url(@booking_week)
  end

  test "should destroy booking_week" do
    assert_difference('BookingWeek.count', -1) do
      delete booking_week_url(@booking_week)
    end

    assert_redirected_to booking_weeks_url
  end
end
