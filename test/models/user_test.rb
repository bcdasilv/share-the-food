require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not save a user without a name" do
    user = User.new

    assert_not user.save, "Saved the user without a name."
  end

  test "should not save a user without an email" do
    user = User.new
    user.name = "Name"

    assert_not user.save, "Saved the user without an email."
  end

  test "should not save a user without a password" do
    user = User.new
    user.name = "Name"
    user.email = "name@email.com"

    assert_not user.save, "Saved the user without a password."
  end

  test "should save a fully valid user" do
    user = users(:default_user)

    assert user.save, "Did not save a valid user."
  end

end
