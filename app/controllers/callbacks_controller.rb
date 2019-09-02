class CallbacksController < Devise::OmniauthCallbacksController
  def spotify
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in(@user)
    # spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    # spotify_user.top_tracks(time_range: 'short_term')
    redirect_to profile_path
  end
end
