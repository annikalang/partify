class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_party_and_playlist
  def set_party_and_playlist
    if current_user
      if controller_name == "parties" && params[:id]
        @party = Party.find(params[:id])
      elsif (controller_name == "playlists" || controller_name == "tracks") && params[:party_id]
        @party = Party.find(params[:party_id])
      end
      @playlist = @party.playlist if @party
    end
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
