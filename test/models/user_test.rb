require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "user shouldn't be saved without data" do
    user = User.new
    assert_not user.save
  end

  test "user name or email or password cant be blank " do
    user_without_name = User.new(email: "asdas@gmail.com")
    assert_not user_without_name.save

    user_without_email = User.new(name: "sadsadf")
    assert_not user_without_email.save

    user_without_password = User.new(name: "asdcs", email: "asdasdsad@gmail.com")
    assert_not user_without_password.save
  end

  test "User is created with all the fields" do
    user_email_1 = User.create(name: "user1",
      email: "user1@gmail.com", password: "12345678",
      password_confirmation: "12345678")

    assert user_email_1.save
  end

  test "user same email cant be used for creation of another user" do
    user_email_1 = User.create(name: "user1",
      email: "user1@gmail.com", password: "12345678",
      password_confirmation: "12345678")

    assert user_email_1.save

    user_email_2 = User.create(name: "user2",
      email: "user1@gmail.com", password: "12345678",
      password_confirmation: "12345678")

    assert_not user_email_2.save
  end


end
