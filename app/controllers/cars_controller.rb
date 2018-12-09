class CarsController < ApplicationController
	before_action :find_car, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]
	def index
	  if params[:type].blank?	
	  	@cars = Car.all.order('make ASC')
	  else
	  	@type_id = Type.find_by(name: params[:type]).id
	  	@cars = Car.where(:type_id => @type_id).order('make ASC')
	  end

	end

	def contact
	end

	def request_contact
		name = params[:name]
		email = params[:email]
		message = params[:message]

		if email.blank?
			flash[:alert] = "You must supply email address"
		else
			flash[:notice] = "Thank you. We'll be in touch"
			ContactMailer.contact_email(name,email,message).deliver_now
		end

		redirect_to root_path
	end

	def show
		if @car.reviews.blank?
			@average = 0
		else
			@average = @car.reviews.average(:rating).round(1)
		end
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
		  params.require(:car).permit(:make, :model, :year, :contact, :type_id, :car_img)
		end

		def find_car
		  @car = Car.find(params[:id])
		end
end
