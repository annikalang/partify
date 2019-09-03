class PartiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:join, :check_passcode]

  def show
    # Find Party of user
    @party = Party.find params[:id]

    # Find playlist to this party
    @playlist = @party.playlist

    # DISPLAY AVERAGES SAVED IN THE PLAYLIST ITSELF
    @danceability = @playlist.danceability.to_i
    @energy = @playlist.energy.to_i
    @popularity = @playlist.popularity.to_i
    @valence = @playlist.valence.to_i
    @genre = @party.playlist.tracks.pluck(:genre)

    @duration = @playlist.get_duration_hrs_and_mins
  end

  def new
    @party = Party.new
  end

  def create
    @user = current_user

    @party = Party.new(party_parameters)
    @party.host = @user

    if @party.save!
      redirect_to party_path(@party)
    else
      render "new"
    end
  end

  def join
    @party = Party.find params[:party_id]
    @passcode = @party.passcode
    # if @passcode == party_parameters[:passcode]
    #   # redirect_to auth_spotify_callback_path
    # else
    #   render "new"
    # end
  end

  def check_passcode
    @party = Party.find params[:party_id]

    if params[:passcode].downcase == @party.passcode.downcase
      redirect_to auth_spotify_callback_path
    end
  end

  def update
  end

  def party_parameters
    params.require(:party).permit(:title, :description, :passcode, :photo)
  end

  # def passcode_params
  #   params.require(:party).permit(:passcode)
  # end
end
