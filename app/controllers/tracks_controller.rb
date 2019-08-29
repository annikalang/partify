class TracksController < ApplicationController
  def index
    @playlist = Playlist.find(params[:playlist_id])
    @tracks = @playlist.tracks
  end
end
