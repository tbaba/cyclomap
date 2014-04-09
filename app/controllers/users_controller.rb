class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @courses = @user.courses.order('id desc')
    @popular_courses = @user.courses.order('stars_count desc').limit(3)
  end

  def edit
  end

  def update
    if @user.update user_params
      redirect_to @user, notice: 'ユーザー情報を更新しました'
    else
      render 'edit'
    end
  end

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:screen_name)
  end
end
