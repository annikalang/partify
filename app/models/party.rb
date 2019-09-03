class Party < ApplicationRecord
  belongs_to :user, optional: true
  validates :photo, presence: true
  validates :title, presence: true
  validates :description, presence: true

  has_one :playlist, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  after_create :create_playlist

  private

  def create_playlist
    self.playlist = Playlist.create!(party_id: self.id)
    SpotifyJob.perform_now(self.playlist.id, self.user.spotify_id)
    self.playlist.save
  end
end
