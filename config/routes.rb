Rails.application.routes.draw do
  # Creates user registration, login routes
  devise_for :users
  # Creates nested routes for reviews, so they are linked with cars
  resources	:cars do 
  	resources :reviews
  end
  # Redirects /contact to contact method within cars controller
  get 'contact', to: 'cars#contact'
  # Sends form info from contact page to request_contact method in cars controller
  post 'request_contact', to: 'cars#request_contact'
  # Setting route path to index page
  root 'cars#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 
