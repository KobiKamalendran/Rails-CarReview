class CarsController < ApplicationController
	before_action :find_car, only: [:show, :edit, :update, :destroy]
	def index
	  @cars = Car.all.order('make ASC')
	end

	def show
	end

	def new
	  @car = current_user.cars.build
	end

	def create
	  @car = current_user.cars.build(car_params)
	  if @car.save
	  	redirect_to root_path
	  else
	  	render 'new'
	  end
	end

	def edit
	end

	def update
	  if @car.update(car_params)
	  	redirect_to car_path(@car)
	  else
	  	render 'edit'
	  end
	end

	def destroy
	  @car.destroy
	  redirect_to root_path
	end

	private

		def car_params
		  params.require(:car).permit(:make, :model, :year, :contact)
		end

		def find_car
		  @car = Car.find(params[:id])
		end
end
