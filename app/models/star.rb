class Star < ActiveRecord::Base
  belongs_to :user
  belongs_to :course, counter_cache: true

  validates_presence_of :user_id, :course_id
  validates_uniqueness_of :course_id, scope: :user_id
end
