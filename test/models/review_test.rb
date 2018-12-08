require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  setup do
  	@review = reviews(:one)
  end

  test "invalid without comment" do
  	@review.comment = nil
  	assert_not @review.save
  end

  test "invalid without rating" do
  	@review.rating = nil
  	assert_not @review.save
  end

  test "invalid with invalid high rating" do
  	@review.rating = 11
  	assert_not @review.save
  end

  test "invalid with invalid low rating" do
  	@review.rating = -1
  	assert_not @review.save
  end

  test "invalid without user" do
  	@review.user = nil
  	assert_not @review.save
  end

  test "invalid without car" do
  	@review.car = nil
  	assert_not @review.save
  end

  test "valid" do
  	@review.save
  	assert @review.valid?
  end

end
