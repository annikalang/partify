class UsersController < ApplicationController
  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
  end

  def profile
    @user = current_user
    @parties = Party.where(user_id: current_user.id)

    # CREATE EMPTY ARRAY TO BE FILLED WITH ALL THE AVERAGE VALUES OF ONE ATTRIBUTE
    @array_danceability = []
    @array_energy = []
    @array_popularity = []
    @array_valence = []

    # ITERATE OVER EACH PARTY PLAYLIST TO STORE THE AVEREGE VALUE INSIDE OF THE ARRAY
    @parties.each do |party|
      @array_danceability << party.playlist.danceability
      @array_energy << party.playlist.energy
      @array_popularity << party.playlist.popularity
      @array_valence << party.playlist.valence
    end

    # CALCULATE THE AVERAGE OF THE ARRAY AND STORE IT IN A VARIABLE
    @average_danceability = (@array_danceability.reduce(:+) / @array_danceability.size.to_f)
    @average_energy = (@array_energy.reduce(:+) / @array_energy.size.to_f)
    @average_popularity = (@array_popularity.reduce(:+) / @array_popularity.size.to_f)
    @average_valence = (@array_valence.reduce(:+) / @array_valence.size.to_f)

    # !! THS CALCULATES THE AVERAGE OF ALL THE PLAYLISTS !!
    # @average_danceability = Playlist.average(:danceability)
  end

  def index
  end

  # def average_value
  #   inject(&:+) / size
  # end
end
