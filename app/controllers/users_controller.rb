class UsersController < ApplicationController
  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
  end

  def profile
    @user = current_user
    @parties = Party.where(host_id: current_user.id)
    @invitations = current_user.parties

    # CREATE EMPTY ARRAY TO BE FILLED WITH ALL THE AVERAGE VALUES OF ONE PARTY
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

    # IF USER HAS PARTIES CALCULATE THE AVERAGE OF THE ARRAY AND STORE IT IN A VARIABLE, ELSE GIVE 0
    if @parties.empty?
      @average_danceability = 0
      @average_energy = 0
      @average_popularity = 0
      @average_valence = 0
    else
      @average_danceability = (@array_danceability.reduce(:+) / @array_danceability.size.to_f)
      @average_energy = (@array_energy.reduce(:+) / @array_energy.size.to_f)
      @average_popularity = (@array_popularity.reduce(:+) / @array_popularity.size.to_f)
      @average_valence = (@array_valence.reduce(:+) / @array_valence.size.to_f)
    end

    # !! THIS CALCULATES THE AVERAGE OF ALL THE PLAYLISTS !!
    # @average_danceability = Playlist.average(:danceability)
  end

  def index
    @party = Party.find params[:party_id]
    @guests = @party.users
  end
end
