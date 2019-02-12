Rails.application.routes.draw do
  get 'home/index'
  get 'home/secret'
  devise_for :users
  resources :events
  resources :users
  root 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
