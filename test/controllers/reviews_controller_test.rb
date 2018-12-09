require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  
  test "get new review page" do
  	@car = cars(:one)
  	get new_car_review_path(@car)
  	assert :response
  end

  test "edit review" do 
  	@car = cars(:one)
  	@review = reviews(:one)
  	get edit_car_review_path(@car,@review)
  	assert :response
  end

end
