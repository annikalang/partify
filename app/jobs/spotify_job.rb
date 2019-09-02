class SpotifyJob < ApplicationJob
  queue_as :default

  def perform(playlist_id, spotify_user_id)
    # query spotify api with spotify_user_id
    # loop through the tracks
    # create tracks in DB using playlist_id as playlist
    spotify_user = RSpotify::User.find(spotify_user_id)

    # THIS CODE GIVES BACK THE FIRST PLAYLIST OF THE USER
    first_playlist = spotify_user.playlists.first
    first_playlist.tracks(limit:30).each do |track|
        Track.create(
          title: track.name,
          playlist_id: playlist_id,
          duration_ms: track.audio_features.duration_ms,
          danceability: (track.audio_features.danceability.to_f * 100).round,
          energy: (track.audio_features.energy.to_f * 100).round,
          valence: (track.audio_features.valence.to_f * 100).round,
          spotify_id: track.id,
          popularity: track.popularity,
          image: track.artists.first.images.last["url"],
          artist: track.artists.first.name,
          genre: track.artists.first.genres.first
        )

# THIS CODE WORKS FOR THE USER'S TOP TRACKS
    # spotify_user.top_tracks(limit: 40, time_range: 'long_term').each do |track|
    #   if track.audio_features.speechiness < 0.4
    #     Track.create(
    #       title: track.name,
    #       playlist_id: playlist_id,
    #       duration_ms: track.audio_features.duration_ms,
    #       danceability: (track.audio_features.danceability.to_f * 100).round,
    #       energy: (track.audio_features.energy.to_f * 100).round,
    #       valence: (track.audio_features.valence.to_f * 100).round,
    #       spotify_id: track.id,
    #       popularity: track.popularity,
    #       image: track.artists.first.images.last["url"],
    #       artist: track.artists.first.name,
    #       genre: track.artists.first.genres.first
    #     )
    end
  end
end
  # end
# end

