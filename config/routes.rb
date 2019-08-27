Rails.application.routes.draw do
  get 'users/spotify'
  get 'users/profile'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  # devise_for :users
  root to: 'pages#home'
  # GET /profile users controller profile action
  get '/profile', to: 'users#profile'
  get '/components', to: 'pages#components'
  get '/auth/spotify/callback', to: 'users#profile'
  post '/auth/spotify/callback', to: 'users#spotify'
  # resources for parties, only [:new, :create, :show]

  resources :parties, only: [:new, :create, :show] do
    resources :guests, only: [:index]
  end

  resources :playlists, only: [:show, :edit, :update] do
    resources :tracks, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
