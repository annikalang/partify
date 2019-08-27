class UsersController < ApplicationController
  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
  end

  def profile
    @users = User.all
  end

  def index

  end
end
