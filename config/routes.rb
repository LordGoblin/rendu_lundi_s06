Rails.application.routes.draw do
  get 'home/index'
  get 'home/secret'
  devise_for :users
  
  resources :users
  resources :events do
  	resources :participations
	end
  root 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
