class Playlist < ApplicationRecord
  belongs_to :party
  has_many :tracks

  before_update :compute_average

  # has_many :artists, through: :tracks

  def compute_average
    tracks = self.tracks

    tracks = tracks.by_energy(self.min_energy, self.max_energy)
    tracks = tracks.by_danceability(self.min_danceability, self.max_danceability)
    tracks = tracks.by_valence(self.min_valence, self.max_valence)
    tracks = tracks.by_popularity(self.min_popularity, self.max_popularity)

     self.danceability = tracks.average(:danceability).round
     self.energy = tracks.average(:energy).round
     self.popularity = tracks.average(:popularity).round
     self.valence = tracks.average(:valence).round

     # self.save!
  end
end

