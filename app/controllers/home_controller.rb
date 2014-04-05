class HomeController < ApplicationController
  def index
    @new_courses = Course.order('id desc').limit(3)
  end
end
