class CarsController < ApplicationController
	before_action :find_car, only: [:show, :edit, :update, :destroy]
	def index
	  @cars = Car.all.order('make ASC')
	end

	def show
	end

	def new
	  @car = current_user.cars.build
	  @carTypes = Type.all.map{ |type| [type.name,type.id]}
	end

	def create
	  @car = current_user.cars.build(car_params)
	  @car.type_id = params[:type_id]
	  if @car.save
	  	redirect_to root_path
	  else
	  	render 'new'
	  end
	end

	def edit
	  @carTypes = Type.all.map{ |type| [type.name,type.id]}
	end

	def update
		@car.type_id = params[:type_id]
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
		  params.require(:car).permit(:make, :model, :year, :contact, :type_id)
		end

		def find_car
		  @car = Car.find(params[:id])
		end
end
