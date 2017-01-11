require 'test_helper'

class AnalystsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @analyst = analysts(:one)
  end

  test "should get index" do
    get analysts_url
    assert_response :success
  end

  test "should get new" do
    get new_analyst_url
    assert_response :success
  end

  test "should create analyst" do
    assert_difference('Analyst.count') do
      post analysts_url, params: { analyst: { company: @analyst.company, email: @analyst.email, name: @analyst.name, tel: @analyst.tel } }
    end

    assert_redirected_to analyst_url(Analyst.last)
  end

  test "should show analyst" do
    get analyst_url(@analyst)
    assert_response :success
  end

  test "should get edit" do
    get edit_analyst_url(@analyst)
    assert_response :success
  end

  test "should update analyst" do
    patch analyst_url(@analyst), params: { analyst: { company: @analyst.company, email: @analyst.email, name: @analyst.name, tel: @analyst.tel } }
    assert_redirected_to analyst_url(@analyst)
  end

  test "should destroy analyst" do
    assert_difference('Analyst.count', -1) do
      delete analyst_url(@analyst)
    end

    assert_redirected_to analysts_url
  end
end
