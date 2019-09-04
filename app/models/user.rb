class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :invitable, omniauth_providers: %i[spotify]

  has_many :party_guests
  has_many :parties, through: :party_guests, dependent: :destroy

  has_many :hosted_parties, class_name: 'Party', foreign_key: 'host_id', dependent: :destroy
  # belongs_to :party_as_guest, class_name: 'Party'

  def self.from_omniauth(auth, party_id = nil)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.image = auth.info.image
      user.display_name = auth.extra.raw_info.display_name
      user.spotify_id = auth.extra.raw_info.id
      user.raw_data = auth
    end

    user.parties.push Party.find(party_id) if party_id

    user
  end
end
