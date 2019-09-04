class Party < ApplicationRecord
  belongs_to :host, class_name: 'User', optional: true
 
  has_many :party_guests
  has_many :users, through: :party_guests, dependent: :destroy

  # has_many :guests, class_name: 'User', foreign_key: 'party_as_guest_id'

  has_one :playlist, dependent: :destroy
  
  validates :photo, presence: true
  validates :title, presence: true
  validates :description, presence: true
  
  mount_uploader :photo, PhotoUploader

  after_create :create_playlist

  private

  def create_playlist
    self.playlist = Playlist.create!(party_id: self.id)
    SpotifyJob.perform_now(self.playlist.id, self.host.spotify_id)
    self.playlist.save
  end
end
