class PartiesController < ApplicationController
  def show
    # Find Party of user
    @party = Party.find params[:id]

    # Find playlist to this party
    @playlist = @party.playlist

    # Set average analytics of playlist's tracks
    @playlist.danceability = @playlist.tracks.average(:danceability)
    @playlist.energy = @playlist.tracks.average(:energy)
    @playlist.popularity = @playlist.tracks.average(:popularity)
    @playlist.valence = @playlist.tracks.average(:valence)
  end

  def new
    @party = Party.new
  end
  def create
    @user = current_user

    @party = Party.new(party_parameters)
    @party.user = @user

    if @party.save!
      redirect_to party_path(@party)
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def party_parameters
    params.require(:party).permit(:title, :description, :photo)
  end
end
