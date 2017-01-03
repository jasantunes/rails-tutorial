require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "signup page's title" do
    get signup_path
    assert_template "users/new"
    assert_select "title", full_title("Sign up")
  end
  
end