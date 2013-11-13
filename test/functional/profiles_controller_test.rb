require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:jason).profile_name #sending in user profile name
    assert_response :success
    assert_template 'profiles/show' #Making sure sending the correct template
  end

  test "show render a 404 on profile not found" do
  	get :show, id: "doesn't exist" 
  	assert_response :not_found #assert 404 response
  end

  test "that variables are assigned on successful profile viewing" do
  	get :show, id: users(:jason).profile_name
  	assert assigns(:user) #Contains instance variables from controllers in a controller test
  	assert_not_empty assigns(:statuses)
  end

  test "only shows the correct user's statuses" do
  	get :show, id: users(:jason).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:jason), status.user
  	end
  end
end
