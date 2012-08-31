require 'test helper'

class UsersControllerTest < ActionController::TestCase
	setup do
		@user = users(:one)

	test "should get index" do
		get :index
		assert_response :success
	end


    test "should get edit user registration" do
    	get :edit_user_registration
    	assert_response :success
    end


    test "should show user" do
    	get :show
    	assert_response :success
    end


    test "should destroy user" do
    	assert_difference('User.count', -1) do
    	    delete :destroy, id: @user.to_param
    	end
    	assert_redirected_to root
    end

    

	  