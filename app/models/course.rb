class Course < ActiveRecord::Base
  ROUTE_LAB_URL_REGEX = %r{http://latlonglab\.yahoo\.co\.jp/route/watch\?id=([A-Za-z0-9_-]*)}

  belongs_to :user
  has_many :stars

  attr_accessor :route_lab_url

  before_save :set_route_lab_id

  private

  def set_route_lab_id
    if self.route_lab_url.present?
      self.route_lab_url.match(ROUTE_LAB_URL_REGEX) do
        self.route_lab_id = $1
      end
    end
  end
end
