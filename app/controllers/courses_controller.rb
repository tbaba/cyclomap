class CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_course, only: [:show]
  before_action :set_user, only: [:new, :create]

  def show; end

  def new
    @course = current_user.courses.new
    render layout: 'user'
  end

  def create
    @course = current_user.courses.new course_params

    if @course.save
      redirect_to @course, notice: 'コースを作成しました'
    else
      render 'new', layout: 'user'
    end
  end

  private

  def set_course
    @course = Course.find params[:id]
  end

  def set_user
    @user = current_user
  end

  def course_params
    params.require(:course).permit(:title, :body, :route_lab_url)
  end
end
