Rails.application.routes.draw do
  
  devise_for :users
  root to: "items#index"
  resources :items, only: [:show, :index] do
    resources :photos, only: [:create]
  end
  resources :home, only: [:index], as: :contact
  resources :carts, except: [:show, :new]
end
