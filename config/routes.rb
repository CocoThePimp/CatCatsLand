Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:show, :index]
  resources :home, only: [:index], as: :contact
  resources :charges

end
