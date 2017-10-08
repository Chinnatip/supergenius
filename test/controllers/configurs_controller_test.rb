require 'test_helper'

class ConfigursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @configur = configurs(:one)
  end

  test "should get index" do
    get configurs_url
    assert_response :success
  end

  test "should get new" do
    get new_configur_url
    assert_response :success
  end

  test "should create configur" do
    assert_difference('Configur.count') do
      post configurs_url, params: { configur: { company_name: @configur.company_name, contact_info: @configur.contact_info, home_slider: @configur.home_slider, top_contact: @configur.top_contact } }
    end

    assert_redirected_to configur_url(Configur.last)
  end

  test "should show configur" do
    get configur_url(@configur)
    assert_response :success
  end

  test "should get edit" do
    get edit_configur_url(@configur)
    assert_response :success
  end

  test "should update configur" do
    patch configur_url(@configur), params: { configur: { company_name: @configur.company_name, contact_info: @configur.contact_info, home_slider: @configur.home_slider, top_contact: @configur.top_contact } }
    assert_redirected_to configur_url(@configur)
  end

  test "should destroy configur" do
    assert_difference('Configur.count', -1) do
      delete configur_url(@configur)
    end

    assert_redirected_to configurs_url
  end
end
