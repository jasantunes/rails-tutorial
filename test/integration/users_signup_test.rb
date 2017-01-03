require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "signup page's title" do
    get signup_path
    assert_template "users/new"
    assert_select "title", full_title("Sign up")
  end
  
  test "invalid signup information does not add user" do
    # assert_no_difference is more idiomatically correct than:
    #   before_count = User.count
    #   post users_path, ...
    #   after_count  = User.count
    #   assert_equal before_count, after_count
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
  end
  
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "foobar123",
                                         password_confirmation: "foobar123" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?   # or assert_select "div.alert-success"
    
  end

end