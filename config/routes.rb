Rails.application.routes.draw do
  devise_for :users
  resources :reviews
  resources	:cars
  root 'cars#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 
