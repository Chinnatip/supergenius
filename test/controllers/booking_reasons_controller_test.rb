require 'test_helper'

class BookingReasonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_reason = booking_reasons(:one)
  end

  test "should get index" do
    get booking_reasons_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_reason_url
    assert_response :success
  end

  test "should create booking_reason" do
    assert_difference('BookingReason.count') do
      post booking_reasons_url, params: { booking_reason: { reason: @booking_reason.reason, ref_code: @booking_reason.ref_code } }
    end

    assert_redirected_to booking_reason_url(BookingReason.last)
  end

  test "should show booking_reason" do
    get booking_reason_url(@booking_reason)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_reason_url(@booking_reason)
    assert_response :success
  end

  test "should update booking_reason" do
    patch booking_reason_url(@booking_reason), params: { booking_reason: { reason: @booking_reason.reason, ref_code: @booking_reason.ref_code } }
    assert_redirected_to booking_reason_url(@booking_reason)
  end

  test "should destroy booking_reason" do
    assert_difference('BookingReason.count', -1) do
      delete booking_reason_url(@booking_reason)
    end

    assert_redirected_to booking_reasons_url
  end
end
