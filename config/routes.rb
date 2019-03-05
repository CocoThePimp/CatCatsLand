Rails.application.routes.draw do
  
  devise_for :users
  root to: "items#index"
  resources :items, only: [:show, :index, :destroy]
  resources :home, only: [:index], as: :contact
  resources :carts, except: [:show, :new]
  resources :charges

end
