require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_index_url
    assert_response :success
  end

  test "should get add" do
    get user_add_url
    assert_response :success
  end

  test "should get transactions" do
    get user_transactions_url
    assert_response :success
  end
end
