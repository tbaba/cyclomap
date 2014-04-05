require 'addressable/uri'

module ApplicationHelper
  def route_lab_course(route_lab_id)
    url = "http://latlonglab.yahoo.co.jp/route/paste?"
    url = Addressable::URI.parse url
    url.query = {
      id: route_lab_id,
      width: 640,
      height: 480,
      mapstyle: 'map',
      graph: true,
      maponly: false
    }.map{|k, v| "#{k}=#{v}" }.join('&')
    javascript_include_tag(url.to_s)
  end
end
