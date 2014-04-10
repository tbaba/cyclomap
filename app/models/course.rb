class Course < ActiveRecord::Base
  ROUTE_LAB_URL_REGEX = %r{http://latlonglab\.yahoo\.co\.jp/route/watch\?id=([A-Za-z0-9_-]*)}

  belongs_to :user
  has_many :stars

  attr_accessor :route_lab_url

  before_save :set_route_lab_id

  validates :title, presence: true, length: { maximum: 5000 }
  validates :body, presence: true, length: { maximum: 50000 }
  validates :route_lab_url, format: { with: URI.regexp(%w(http https)), allow_blank: true }

  private

  def set_route_lab_id
    if self.route_lab_url.present?
      self.route_lab_url.match(ROUTE_LAB_URL_REGEX) do
        self.route_lab_id = $1
      end
    end
  end
end
