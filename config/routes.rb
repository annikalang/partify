Rails.application.routes.draw do
  # get 'parties/new'
  # get 'parties/edit'
  # get 'parties/update'
  # get 'playlists/new'
  # get 'playlists/update'
  # get 'playlists/edit'
  # get 'users/spotify'
  # get 'users/profile'

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
    resources :users, only: [:index]
    resources :playlists, only: [:show, :edit, :update, :new] do
    resources :tracks, only: [:index]
  end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
