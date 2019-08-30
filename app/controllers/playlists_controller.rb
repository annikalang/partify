class PlaylistsController < ApplicationController
  def new
    @playlist = Playlist.new
  end

  def update
    @playlist = Playlist.find(params[:id])
    @playlist.update_attributes playlist_params
    @party = Party.find(params[:party_id])
    redirect_to party_playlist_tracks_path(@party, @playlist)
  end

  def edit
    @party = Party.find(params[:party_id])
    @playlist = Playlist.find(params[:id])
    @tracks = @playlist.tracks
  end

  def playlist_params
    params.require(:playlist).permit(
      :min_energy,
      :max_energy,
      :min_danceability,
      :max_danceability,
      :min_valence,
      :max_valence,
      :min_popularity,
      :max_popularity
    )
  end

end
