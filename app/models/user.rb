class User < ActiveRecord::Base
  devise :trackable, :omniauthable

  mount_uploader :profile_image, ProfileImageUploader

  class << self
    def authenticate(auth)
      profile_image_url = auth.info.image.gsub!(/_normal/, '')
      user = where(auth.slice(:uid, :provider)).first_or_initialize
      user.screen_name ||= auth.info.nickname
      user.remote_profile_image_url = profile_image_url
      user.save
      user
    end
  end

  has_many :courses, dependent: :destroy
  has_many :stars
  has_many :given_stars, through: :courses, source: :stars
end
