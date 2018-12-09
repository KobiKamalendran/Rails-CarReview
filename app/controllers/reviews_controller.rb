class ReviewsController < ApplicationController
	# Find car instance before any action, as each review is associated with a car
	before_action	:find_car
	# Review instance is required before edit,update or destroy action
	before_action	:find_review, only: [:edit, :update, :destroy]
	# User must be logged in to create a review or edit their review
	before_action 	:authenticate_user!, only: [:new, :edit]
	
	# Create new review instance
	def new
		@review = Review.new
	end

	# Directed here, once user has filled review form
	def create
		# Review properties filled using user inputs from view
		@review = Review.create(review_params)
		# Linking review to car
		@review.car_id = @car.id
		# Linking review to user 
		@review.user_id = current_user.id
		# Attempts to save review
		if @review.save
			# Once saved, redirected to show page of car, review should be visible
			redirect_to car_path(@car)
		else
			# If not saved, go to new review page again
			render 'new'
		end
	end

	# Renders edit review view
	def edit
	end

	# Directed here once user has filled edit form
	def update
		# Attempts to update review using user inputs
		if @review.update(review_params)
			# Once updated, redirected to show page of car
			redirect_to car_path(@car)
		else
			# If not updated, edit form is loaded once again
			render 'edit'
		end
	end

	# Destroys review instance then directs back to car show page
	def destroy
		@review.destroy
		redirect_to car_path(@car)
	end



	private
		# Defining what the review parameters permit
		def review_params
			params.require(:review).permit(:comment, :rating)
		end
		# Attempts to find car using car id
		def find_car
			@car = Car.find(params[:car_id])
		end
		# Attempts to find review using review id
		def find_review
			@review = Review.find(params[:id])
		end
end
