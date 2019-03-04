Rails.application.routes.draw do
  resources :items, only: [:show, :index]

  root 'items#index'
end
