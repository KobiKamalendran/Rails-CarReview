require 'test_helper'

class CarsControllerTest < ActionDispatch::IntegrationTest

	test "should get home" do
		get cars_path
		assert_response :success
	end

	test "should get login page" do
		get new_user_session_path
		assert_response :success
	end

	test "should get user sign up page" do
		get new_user_registration_path
		assert_response :success
	end





end
