class SpotifyJob < ApplicationJob
  queue_as :default

  def perform(playlist_id, spotify_user_id)
    # query spotify api with spotify_user_id
    # loop through the tracks
    # create tracks in DB using playlist_id as playlist
    spotify_user = RSpotify::User.find(spotify_user_id)

    spotify_user.playlists.first.tracks.each do |track|
      #playlist.tracks.each do |track|
        Track.create(
          title: track.name,
          playlist_id: playlist_id,
          duration_ms: track.audio_features.duration_ms,
          danceability: track.audio_features.danceability,
          energy: track.audio_features.energy,
          valence: track.audio_features.valence,
          spotify_id: track.id,
          popularity: track.popularity,
          image: track.artists.first.images.last["url"]
        )
      end
  end
end

