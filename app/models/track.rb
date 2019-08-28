class Track < ApplicationRecord
  has_one :artist
  belongs_to :playlist
end
