class ReviewsController < ApplicationController
	before_action	:find_car
	before_action	:find_review, only: [:edit, :update, :destroy]
	before_action 	:authenticate_user!, only: [:new, :edit]
	def new
		@review = Review.new
	end


	def create
		@review = Review.create(review_params)
		@review.car_id = @car.id
		@review.user_id = current_user.id
		if @review.save
			redirect_to car_path(@car)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @review.update(review_params)
			redirect_to car_path(@car)
		else
			render 'edit'
		end
	end

	def destroy
		@review.destroy
		redirect_to car_path(@car)
	end



	private

		def review_params
			params.require(:review).permit(:comment, :rating)
		end

		def find_car
			@car = Car.find(params[:car_id])
		end

		def find_review
			@review = Review.find(params[:id])
		end
end
