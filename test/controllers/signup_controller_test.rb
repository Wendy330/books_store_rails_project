require 'test_helper'

class SignupControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_up" do
    get signup_sign_up_url
    assert_response :success
  end

end
