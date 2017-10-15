require 'test_helper'

class AddcoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @addcourse = addcourses(:one)
  end

  test "should get index" do
    get addcourses_url
    assert_response :success
  end

  test "should get new" do
    get new_addcourse_url
    assert_response :success
  end

  test "should create addcourse" do
    assert_difference('Addcourse.count') do
      post addcourses_url, params: { addcourse: { course: @addcourse.course, desc: @addcourse.desc, type: @addcourse.type } }
    end

    assert_redirected_to addcourse_url(Addcourse.last)
  end

  test "should show addcourse" do
    get addcourse_url(@addcourse)
    assert_response :success
  end

  test "should get edit" do
    get edit_addcourse_url(@addcourse)
    assert_response :success
  end

  test "should update addcourse" do
    patch addcourse_url(@addcourse), params: { addcourse: { course: @addcourse.course, desc: @addcourse.desc, type: @addcourse.type } }
    assert_redirected_to addcourse_url(@addcourse)
  end

  test "should destroy addcourse" do
    assert_difference('Addcourse.count', -1) do
      delete addcourse_url(@addcourse)
    end

    assert_redirected_to addcourses_url
  end
end
