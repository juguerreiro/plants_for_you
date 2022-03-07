Rails.application.routes.draw do
  devise_for :users
  root to: 'plants#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :plants, only: [:show, :index, :new, :create]
end
