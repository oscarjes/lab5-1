require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should allow setting name" do
    a = User.new
    a.name = "Bob"
    assert_equal "Bob", a.name
  end

  test "should not save without email" do
    a = User.new
    assert_not a.save
    assert_equal ["can't be blank"], a.errors[:email]
    end
end
