Rails.application.routes.draw do
  
  # resources :charges
  resources :home, only: [:index], as: :contact
  root to: "items#index"
  devise_for :users, :controllers => { registrations: 'registrations' }, path_names: {sign_in: "connexion", sign_out: "déconnexion", edit: "paramètres"}

  scope(path_names: { index: 'catalogue_des_produits', show: 'detail', create: 'nouvel_article'}) do
    resources :items, only: [:index, :show, :create, :destroy], path: 'catalogue_des_produits'
  end

  resources :carts, except: [:show, :new], path: 'panier'

  scope(path_names: { show: 'mes_commandes', create: 'nouvelle_commande'}) do
    resources :orders, only: [:create, :show], path: 'mes_commandes'
  end
  
  scope(path_names: { show: 'mon_profil', new: 'nouveau_profil', update: 'modification_profil', create: 'création_profil', index: 'profil'}) do
    resources :profiles, only: [:show, :update,  :create, :index], path: 'mon_profil'
  end

  namespace :admin do
    resources :users , path: 'espace_admin'
    resources :items do
      resources :catpics, only: [:create]
    end
    resources :orders, path: 'espace_commandes'
  end

end
