class CarsController < ApplicationController
	# Car instance is needed for show,edit,update,destroy methods
	before_action :find_car, only: [:show, :edit, :update, :destroy]
	# Users have to be signed in before they can create a new car or edit one
	before_action :authenticate_user!, only: [:new, :edit]
	
	# If user tries to access records that do not exist, they are sent to home page
	rescue_from ActiveRecord::RecordNotFound, with: :no_Record

	# Sending user back to home page as record cannot be found
	def no_Record
		redirect_to root_path
	end
	

	# Finding the relevant cars for the main page
	def index
	  # If user has not asked for a specific type of car, all cars are returned
	  if params[:type].blank?	
	  	@cars = Car.all.order('make ASC')
	  else
	  	# User has asked for a particular type of car
	  	# All cars of that type are returned
	  	@type_id = Type.find_by(name: params[:type]).id
	  	@cars = Car.where(:type_id => @type_id).order('make ASC')
	  end

	end

	# Needed for contact view
	def contact
	end

	# Directed here from contact view, attempts to send email using user inputs
	def request_contact
		# Storing all user inputs into variables
		name = params[:name]
		email = params[:email]
		message = params[:message]

		# Checking if email has been entered
		if email.blank?
			flash[:alert] = "You must supply email address"
		else
			# Sends email now and alerts user that its done so
			ContactMailer.contact_email(name,email,message).deliver_now
			flash[:notice] = "Thank you. We'll be in touch"
		end
		# Once email has been sent, page is redirected to home page
		redirect_to root_path
	end

	# Shows an individual car in a page
	def show
		# Checks if the car has any reviews
		if @car.reviews.blank?
			@average = 0
		else
			# The car has reviews, so it works out the average rating
			@average = @car.reviews.average(:rating).round(1)
		end
	end

	# New car is associated with logged in user
	# All car types are loaded for user to choose what type the car is in the form
	def new
	  @car = current_user.cars.build
	  @carTypes = Type.all.map{ |type| [type.name,type.id]}
	end

	# Once new car form is filled, returns here
	def create
	  # Builds new car instance using parameters user has filled in the form
	  @car = current_user.cars.build(car_params)
	  # Setting the car's type
	  @car.type_id = params[:type_id]
	  # Attempts to save car instance
	  if @car.save
	  	# Once saved, page is redirected to home page
	  	redirect_to root_path
	  else
	  	# If car instance has not been saved, form is rendered again
	  	render 'new'
	  end
	end

	# Edit view is rendered, car types are loaded if user was to change them in view
	def edit
	  @carTypes = Type.all.map{ |type| [type.name,type.id]}
	end

	# Once edited, comes to this method
	def update
		# Sets car type
		@car.type_id = params[:type_id]
	  if @car.update(car_params)
	  	 # If updated, goes to show page of the car
	  	redirect_to car_path(@car)
	  else
	  	# If not updated, loads edit view once again
	  	render 'edit'
	  end
	end

	# Destroys car instance then redirects to home page
	def destroy
	  @car.destroy
	  redirect_to root_path
	end

	private
		# Defines what parameters are permitted for a car instance
		def car_params
		  params.require(:car).permit(:make, :model, :year, :contact, :type_id, :car_img)
		end

		# Attempts to find the car record using id
 		def find_car
		  @car = Car.find(params[:id])
		end
end
