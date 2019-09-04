Rails.application.routes.draw do
  # get 'parties/new'
  # get 'parties/edit'
  # get 'parties/update'
  # get 'playlists/new'
  # get 'playlists/update'
  # get 'playlists/edit'
  # get 'users/spotify'
  # get 'users/profile'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", invitations: 'invitations' }

  # devise_for :users
  root to: 'pages#home'
  # GET /profile users controller profile action
  get '/profile', to: 'users#profile'
  get '/components', to: 'pages#components'
  get '/auth/spotify/callback', to: 'users#profile'
  post '/auth/spotify/callback', to: 'users#spotify'
  get  '/onboarding', to: 'pages#onboarding'
  # resources for parties, only [:new, :create, :show]
  post '/playlists/spotify', to: 'playlists#push_to_spotify'

  resources :parties, only: [:new, :create, :show] do
    get '/join', to: 'parties#join'
    post '/check_passcode', to: 'parties#check_passcode'
    resources :users, only: [:index]
    resources :playlists, only: [:show, :edit, :update, :new] do
      post 'create_on_spotify', to: 'playlists#push_to_spotify'
      resources :tracks, only: [:index]
    end
  end

  require "sidekiq/web"
  authenticate :user, lambda { |u| true } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
