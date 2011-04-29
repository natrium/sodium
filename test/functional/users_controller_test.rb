require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get change_avatar" do
    get :change_avatar
    assert_response :success
  end

end
