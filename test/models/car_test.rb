require 'test_helper'

class CarTest < ActiveSupport::TestCase

  setup do
  	@car = cars(:one)
  end
		
  test "invalid without make" do
  	@car.make = nil
  	assert_not @car.save, "Saved car without make"
  end

  test "invalid without model" do
  	@car.model = nil
  	assert_not @car.save, "Saved car without model"
  end

  test "invalid without year" do
  	@car.year = nil
  	assert_not @car.save, "Saved car without year"
  end

  test "invalid without contact" do
  	@car.contact = nil
  	assert_not @car.save, "Saved car without contact"
  end

  test "invalid without associated user" do
  	@car.user = nil
  	assert_not @car.save, "Saved car without user"
  end

  test "invalid without associated type" do
  	@car.type = nil
  	assert_not @car.save, "Saved car without type"
  end

  test "valid" do
  	@car.save
  	assert @car.valid?
  end



end
