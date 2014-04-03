class User < ActiveRecord::Base
  devise :trackable, :omniauthable

  class << self
    def find_by_twitter_auth(auth)
      where(auth.slice(:uid, :provider)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.screen_name = auth.info.nickname
      end
    end
  end
end
