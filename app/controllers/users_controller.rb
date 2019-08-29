class UsersController < ApplicationController
  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
  end

  def profile
    @user = current_user
    @parties = Party.where(user_id: current_user.id)
  end

  def index
  end
end
