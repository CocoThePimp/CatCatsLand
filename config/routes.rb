Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:show, :index]

  get '/contact', to: 'home#index', as: :contact


end
