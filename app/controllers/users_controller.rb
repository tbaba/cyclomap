class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @courses = @user.courses.order('id desc')
    @popular_courses = @user.courses.order('stars_count desc').limit(3)
  end

  def set_user
    @user = User.find params[:id]
  end
end
