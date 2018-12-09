Rails.application.routes.draw do
  devise_for :users
  resources	:cars do 
  	resources :reviews
  end
  
  get 'contact', to: 'cars#contact'

  post 'request_contact', to: 'cars#request_contact'

  root 'cars#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 
