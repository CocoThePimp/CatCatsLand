Rails.application.routes.draw do
  

  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "items#index"
  resources :items, only: [:show, :index, :destroy]
  resources :home, only: [:index], as: :contact
  resources :carts, except: [:show, :new]
  resources :orders, only: [:create, :show]
  resources :charges
  resources :profiles, only: [:show, :update,  :create, :index]

  namespace :admin do
    resources :users 
    resources :items
    resources :orders
  end

end
