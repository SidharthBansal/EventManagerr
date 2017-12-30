require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
  
  def setup
    @user = users(:batman)
    @other_user = users(:robin)
    @base_title = "| EventManager"
  end
  
  test "should get index" do
    sign_in @user
    get users_path
    assert_response :success
    # assert_select "title", "Users #{@base_title}"
  end
  
  test "get show not logged in" do
    get user_path(@user.id)
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end
  
  test "get show logged in as wrong user" do
    sign_in @other_user
    get user_path(@user.id)
    assert_response :success
    assert_select "title", "#{@user.username} #{@base_title}"
    assert_select "a[href=?]", edit_user_registration_path, false
  end
  

  test "should get show" do
    sign_in @user
    get user_path(@user.id)
    assert_response :success
    assert_select "title", "#{@user.username} #{@base_title}"
    assert_select "a[href=?]", edit_user_registration_path(@user.id)
  end

end
