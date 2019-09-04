class Playlist < ApplicationRecord
  belongs_to :party
  has_many :tracks, dependent: :destroy

  before_update :compute_average

  # has_many :artists, through: :tracks

  def compute_average
    tracks = self.tracks

    if tracks.size.positive?
      tracks = tracks.by_energy(self.min_energy, self.max_energy)
      tracks = tracks.by_danceability(self.min_danceability, self.max_danceability)
      tracks = tracks.by_valence(self.min_valence, self.max_valence)
      tracks = tracks.by_popularity(self.min_popularity, self.max_popularity)

      self.danceability = tracks.average(:danceability).round
      self.energy = tracks.average(:energy).round
      self.popularity = tracks.average(:popularity).round
      self.valence = tracks.average(:valence).round
    end
     # self.save!
  end

  def get_duration_hrs_and_mins
    tracks = self.tracks

    if tracks.size.positive?
      tracks = tracks.by_energy(self.min_energy, self.max_energy)
      tracks = tracks.by_danceability(self.min_danceability, self.max_danceability)
      tracks = tracks.by_valence(self.min_valence, self.max_valence)
      tracks = tracks.by_popularity(self.min_popularity, self.max_popularity)

      hours = tracks.sum(:duration_ms) / (1000 * 60 * 60)
      minutes = tracks.sum(:duration_ms) / (1000 * 60) % 60
      "#{hours}:#{minutes}h"
    end
  end

  def scoped_tracks_size
    tracks = self.tracks

    tracks = tracks.by_energy(self.min_energy, self.max_energy)
    tracks = tracks.by_danceability(self.min_danceability, self.max_danceability)
    tracks = tracks.by_valence(self.min_valence, self.max_valence)
    tracks = tracks.by_popularity(self.min_popularity, self.max_popularity)

    tracks.size

  end
end

