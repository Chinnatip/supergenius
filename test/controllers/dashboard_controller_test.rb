require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_index_url
    assert_response :success
  end

  test "should get new" do
    get dashboard_new_url
    assert_response :success
  end

  test "should get product" do
    get dashboard_product_url
    assert_response :success
  end

end
