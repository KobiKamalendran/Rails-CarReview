Rails.application.routes.draw do
  resources :reviews
  resources	:cars
  resources :users
  root 'cars#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 
