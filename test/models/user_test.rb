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

  test "should allow setting password" do 
    a = User.new name: "Adam"
    a.password = "asdf"
    assert_equal "asdf", a.password
  end

  test "should not save without a password" do 
    a = User.create name: "Adam", email: "a@example.come"
    assert_equal ["can't be blank"], a.errors[:password]
  end

  test "should save with a password but without confirmation" do
    a = User.create name: "Adam", email: "a@example.com", password: "asdf"
    assert a.save
  end

  test "should not save with incorrect password_conformation" do 
    a = User.new name: "Adam", email: "a@example.come"
    a.password = "asdf"
    a.password_confirmation = ""
    a.save
    assert_equal ["doesn't match Password"], a.errors[:password_confirmation]
  end

  test "should save with correct password confirmation" do 
    a = User.new name: "Adam", email: "a@example.com"
    a.password = "asdf"
    a.password_confirmation = "asdf"
    assert a.save 
  end

  test "authenticate should return true if password mathces" do 
    a = User.create! name: "Adam", email: "a@example.come", password: "asdf"
    assert a.save
    assert_not a.authenticate("something")
    assert a.authenticate("asdf")
  end
end
