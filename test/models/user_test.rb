require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user should successfully save" do
    assert User.new(firstName: 'First Name', lastName: 'Last Name', email: '123@gmail.com', password: '12345678',
      password_confirmation: '12345678').save
  end
  
  test "passwords should be same" do
    assert_not User.new(firstName: 'First Name', lastName: 'Last Name', email: '123@gmail.com', password: '56785678',
      password_confirmation: '12345678').save
  end
  
  test "email needs to be correct" do
    assert_not User.new(firstName: 'First Name', lastName: 'Last Name', email: '123gmail.com', password: '12345678',
      password_confirmation: '12345678').save
  end
  
  test "email does not need to be validated" do
    assert User.new(firstName: 'First Name', lastName: 'Last Name', email: '123gmail.com', password: '12345678',
      password_confirmation: '12345678', uid: '12', provider: "twitter").save
  end
  
  # test "should trigger password validation" do
  #   assert_not User.new(firstName: 'First Name', lastName: 'Last Name', email: '123@gmail.com').save
  # end
end
