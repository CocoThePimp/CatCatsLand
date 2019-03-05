Rails.application.routes.draw do
  get 'orders/show'
  get 'orders/create'
  devise_for :users
  root to: "items#index"
  resources :items, only: [:show, :index]
  resources :home, only: [:index], as: :contact
  resources :order, only: [:show, :create]


end
