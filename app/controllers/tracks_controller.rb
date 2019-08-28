class TracksController < ApplicationController
  def index
    spotify_user = RSpotify::User.find(current_user.spotify_id)
    spotify_user.playlists.each do |playlist|
      puts playlist.name
      playlist.tracks.sort_by(&:popularity).each do |track|
        puts "\t#{track.name} #{track.artists.map do |a| a.name end}"
      end
    end
  end
end
