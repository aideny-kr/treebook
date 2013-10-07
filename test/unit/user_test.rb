require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "a user should enter a first name" do
		user = User.new
		assert !user.save #user should not be saved in database
		assert !user.errors[:first_name].empty? #Asserting that the errors on the first name field is not empty
	end

	test "a user should enter a last name" do
		user = User.new
		assert !user.save #user should not be saved in database
		assert !user.errors[:last_name].empty? #Asserting that the errors on the first name field is not empty
	end

	test "a user should enter a profile name" do
		user = User.new
		assert !user.save #user should not be saved in database
		assert !user.errors[:profile_name].empty? #Asserting that the errors on the first name field is not empty
	end

	test "a user should have a unique profile name" do
		user = User.new

		user.profile_name = users(:huichanyi).profile_name
	
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a profile name without spaces" do
		user = User.new

		user.profile_name = "Huichan Yi"
		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formatted correctly")
	end



end
