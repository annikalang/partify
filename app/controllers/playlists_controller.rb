class PlaylistsController < ApplicationController
  def new
    @playlist = Playlist.new
  end

  def update
    @playlist = Playlist.find(params[:id])
    @playlist.update_attributes playlist_params
    @party = Party.find(params[:party_id])
    redirect_to party_path(@party)
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

  def push_to_spotify
    local_playlist = Playlist.find params[:playlist_id]
    local_party = Party.find params[:party_id]
    user = RSpotify::User.new(current_user.raw_data)
    tracks = local_playlist.tracks.map { |track| "spotify:track:#{track.spotify_id}" }
    playlist = user.create_playlist!(local_party.title , public: false)

    playlist.add_tracks!(tracks)
  end

end
