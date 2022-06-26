require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest  
  setup do
    @user = users(:one)
  end

  test "should show user" do
    get api_v1_user_url(@user), as: :json 
    assert_response :success
    # Test to ensure response contains the correct email 
    json_response = JSON.parse(self.response.body) 
    assert_equal @user.email, json_response['email']
  end

  test "should update user" do
    patch api_v1_user_url(@user), params: { user: { email: @user.email, password:
      'new_password' } }, as: :json
    assert_response :success
  end

  test "should not update user when invalid params are sent" do
    patch api_v1_user_url(@user), params: { user: { email: 'bad_email', password:
      'new_password' } }, as: :json
    assert_response :unprocessable_entity
  end
end