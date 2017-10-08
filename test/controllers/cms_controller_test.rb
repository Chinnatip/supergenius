require 'test_helper'

class CmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cm = cms(:one)
  end

  test "should get index" do
    get cms_url
    assert_response :success
  end

  test "should get new" do
    get new_cm_url
    assert_response :success
  end

  test "should create cm" do
    assert_difference('Cm.count') do
      post cms_url, params: { cm: { content: @cm.content, seo_description: @cm.seo_description, seo_title: @cm.seo_title, tagid: @cm.tagid, title: @cm.title, viewer: @cm.viewer } }
    end

    assert_redirected_to cm_url(Cm.last)
  end

  test "should show cm" do
    get cm_url(@cm)
    assert_response :success
  end

  test "should get edit" do
    get edit_cm_url(@cm)
    assert_response :success
  end

  test "should update cm" do
    patch cm_url(@cm), params: { cm: { content: @cm.content, seo_description: @cm.seo_description, seo_title: @cm.seo_title, tagid: @cm.tagid, title: @cm.title, viewer: @cm.viewer } }
    assert_redirected_to cm_url(@cm)
  end

  test "should destroy cm" do
    assert_difference('Cm.count', -1) do
      delete cm_url(@cm)
    end

    assert_redirected_to cms_url
  end
end
