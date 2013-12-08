require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

  test "should get test" do
    get :test
    assert_response :success
  end

  test "should get result" do
    get :result
    assert_response :success
  end

end
