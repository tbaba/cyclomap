class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @courses = @user.courses.order('id desc')
  end

  def set_user
    @user = User.find params[:id]
  end
end
