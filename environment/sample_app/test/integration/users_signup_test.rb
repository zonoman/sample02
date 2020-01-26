require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test  "valid signup information" do
    get signup_path
    assert_difference 'User.count',1 do
      post users_path, params:{ user:{ name: "ddd",email:"user@gmail.com",
                              password:"foooooo",password_confirmation:"foooooo"}}
    end

    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
    assert is_logged_in?
  end



    
end
