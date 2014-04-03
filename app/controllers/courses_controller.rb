class CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_course, only: [:show]

  def show; end

  def new
    @course = current_user.courses.new
  end

  def create
    @course = current_user.courses.new course_params

    if @course.save
      redirect_to @course, notice: 'コースを作成しました'
    else
      render 'new'
    end
  end

  private

  def set_course
    @course = Course.find params[:id]
  end

  def course_params
    params.require(:course).permit(:title, :body)
  end
end
