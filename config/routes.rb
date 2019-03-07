Rails.application.routes.draw do
  

  # resources :charges
  resources :home, only: [:index], as: :contact

  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: "items#index"

  scope(path_names: { index: 'catalogue_des_produits', show: 'ohohohoh_il_est_trop_mimi', destroy: 'oupsy...gone'}) do
    resources :items, only: [:index, :show, :create], path: 'photos_de_chatons'
  end

  scope(path_names: { show: 'voici_ton_panier', new: 'nouveau_panier'}) do
    resources :carts, except: [:show, :new], path: 'mon_panier'
  end

  scope(path_names: { show: 'mes_commandes', new: 'nouvelle_commande'}) do
    resources :orders, only: [:create, :show], path: 'mes_commandes'
  end
  
  scope(path_names: { show: 'mon_profile', new: 'nouveau_profile', update: 'modification_profile', create: 'creation_profile', index: 'profile'}) do
    resources :profiles, only: [:show, :update,  :create, :index], path: 'mon_profile'
  end

  namespace :admin do
    resources :users 
    resources :items
    resources :orders
  end

end
