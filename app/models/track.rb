class Track < ApplicationRecord
  belongs_to :playlist
  has_one :artist
end
