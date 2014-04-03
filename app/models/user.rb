class User < ActiveRecord::Base
  devise :trackable, :omniauthable

  mount_uploader :profile_image, ProfileImageUploader

  class << self
    def authenticate(auth)
      where(auth.slice(:uid, :provider)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.screen_name = auth.info.nickname
      end
    end
  end

  has_many :courses, dependent: :destroy
end
