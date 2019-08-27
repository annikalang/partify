class Party < ApplicationRecord
  belongs_to :user
  has_one :playlist
  has_many :tracks, through: :playlists
end
