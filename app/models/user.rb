class User < ActiveRecord::Base
  devise :trackable, :omniauthable

  mount_uploader :profile_image, ProfileImageUploader

  class << self
    def authenticate(auth)
      profile_image_url = auth.info.image.gsub!(/_normal/, '')
      user = where(auth.slice(:uid, :provider)).first_or_initialize
      user.update screen_name: auth.info.nickname, remote_profile_image_url: profile_image_url
      user
    end
  end

  has_many :courses, dependent: :destroy
end
