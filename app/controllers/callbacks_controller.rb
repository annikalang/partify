class CallbacksController < Devise::OmniauthCallbacksController
  def spotify
    user_id = session[:user_id]
    party_id = user_id ? User.find(user_id).party_as_guest_id : nil

    @user = User.from_omniauth(request.env["omniauth.auth"], party_id)

    RSpotify::User.new(request.env['omniauth.auth'])

    User.find(user_id).destroy if user_id

    sign_in(@user)
    redirect_to profile_path
  end
end
