Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # GET /profile users controller profile action
  get '/profile', to: 'users#profile'
  # resources for parties, only [:new, :create, :show]
  resources :parties, only: [:new, :create, :show] do
    resources :guests, only: [:index]
  end

  resources :playlists, only: [:show, :edit] do
    resources :tracks, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
