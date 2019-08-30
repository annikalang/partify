class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_party_and_playlist


  def set_party_and_playlist
    if current_user
      if controller_name == "parties"
        @party = Party.find(params[:id])
      elsif controller_name == "playlists" || controller_name == "tracks"
        @party = Party.find(params[:party_id])
      end
      @playlist = @party.playlist
    end
  end
end
