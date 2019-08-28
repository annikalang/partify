class Playlist < ApplicationRecord
  belongs_to :party
  has_many :tracks
  has_many :artists, through: :tracks
end

