class Cyclist < ActiveRecord::Base
  devise :trackable, :omniauthable
end
