class Track < ApplicationRecord
  has_one :artist
  belongs_to :playlist

  scope :by_energy, -> (min, max) { where(energy: min..max) }
  scope :by_danceability, -> (min, max) { where(danceability: min..max) }
  scope :by_valence, -> (min, max) { where(valence: min..max) }
  scope :by_popularity, -> (min, max) { where(popularity: min..max) }
end
