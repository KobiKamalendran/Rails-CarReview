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

	test "should get contact" do
		get contact_path

		assert_response :success
		assert_select 'h1', 'Contact Us'
	end


	test "should show car" do
		@car = cars(:one)
		get car_path(@car)
		assert_response :success
	end



	test "should post request contact but no email" do
		post request_contact_url

		assert_response :redirect
		assert_not_empty flash[:alert]
		assert_nil flash[:notice]

	end


	test "should post request contact" do
		post request_contact_path, params: {
			name: "Matthew", email: "matthew@me.com",
			message: "Interested" }

		assert_response :redirect
		assert_nil flash[:alert]
		assert_not_empty flash[:notice]
	end



end
