class Playlist < ApplicationRecord
  belongs_to :party
  has_many :tracks
  #after_save :compute_average

  # has_many :artists, through: :tracks

  # def compute_average
  #  self.danceability = self.tracks.average(:danceability)
  #  self.energy = self.tracks.average(:energy)
  #  self.popularity = self.tracks.average(:popularity)
  #  self.valence = self.tracks.average(:valence)
  # end

end

