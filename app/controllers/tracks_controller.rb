class TracksController < ApplicationController
  def index
    @playlist = Playlist.find(params[:playlist_id])
    @tracks = @playlist.tracks

    @tracks = @tracks.by_energy(@playlist.min_energy, @playlist.max_energy)
    @tracks = @tracks.by_danceability(@playlist.min_danceability, @playlist.max_danceability)
    @tracks = @tracks.by_valence(@playlist.min_valence, @playlist.max_valence)
    @tracks = @tracks.by_popularity(@playlist.min_popularity, @playlist.max_popularity)

    # @playlist.tracks = @tracks
  end
end
