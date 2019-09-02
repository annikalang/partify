class SpotifyJob < ApplicationJob
  queue_as :default

  def perform(playlist_id, spotify_user_id)
    # query spotify api with spotify_user_id
    # loop through the tracks
    # create tracks in DB using playlist_id as playlist
    spotify_user = RSpotify::User.find(spotify_user_id)

    # THIS CODE GIVES BACK THE FIRST PLAYLIST OF THE USER
    first_playlist = spotify_user.playlists.first

    ingest_tracks(playlist_id, first_playlist)
  end

  def ingest_tracks(playlist_id, playlist)
    puts 'Fetching data...'
    tracks = playlist.tracks(limit: 30).map do |track|
      track_data = {}

      track_data[:title] = track.name
      track_data[:playlist_id] = playlist_id
      track_data[:duration_ms] = track.audio_features.duration_ms
      track_data[:danceability] = (track.audio_features.danceability.to_f * 100).round
      track_data[:energy] = (track.audio_features.energy.to_f * 100).round
      track_data[:valence] = (track.audio_features.valence.to_f * 100).round
      track_data[:popularity] = track.popularity
      track_data[:spotify_id] = track.id
      track_data[:image] = track.artists.first.images.last["url"]
      track_data[:artist] = track.artists.first.name
      track_data[:genre] = track.artists.first.genres.first

      track_data
    end

    Track.create(tracks)

    rescue RestClient::TooManyRequests => e
      sleep(10)

      ingest_tracks(playlist_id, playlist)
  end
end
  # end
# end

