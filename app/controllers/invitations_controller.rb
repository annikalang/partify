class InvitationsController < Devise::InvitationsController
  def new
    @party = params[:party]
    super
  end

  def create
    User.invite!(user_params)
    redirect_to party_users_path(user_params[:party_as_guest_id])
  end

  def edit
    if params[:invitation_token] && params[:user_id]
      session[:user_id] = params[:user_id]
      render :edit
    else
      set_flash_message(:alert, :invitation_token_invalid)
      redirect_to after_sign_out_path_for(resource_name)
    end
  end

  def user_params
    params.require(:user).permit(:email, :party_as_guest_id)
  end
end
