require 'test_helper'

class InvestorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get investor_index_url
    assert_response :success
  end

  test "should get financial" do
    get investor_financial_url
    assert_response :success
  end

  test "should get share" do
    get investor_share_url
    assert_response :success
  end

  test "should get bond" do
    get investor_bond_url
    assert_response :success
  end

  test "should get stock" do
    get investor_stock_url
    assert_response :success
  end

  test "should get news" do
    get investor_news_url
    assert_response :success
  end

  test "should get contact" do
    get investor_contact_url
    assert_response :success
  end

end
