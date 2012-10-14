require 'test_helper'

class RegisterControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get tos" do
    get :tos
    assert_response :success
  end

end
