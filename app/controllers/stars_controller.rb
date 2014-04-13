class StarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: [:create]

  def create
    @star = @course.stars.new
    @star.user = current_user

    if @star.save
      redirect_to @course, notice: 'スターを付けました'
    else
      redirect_to @course, alert: @star.errors.full_messages.join('\n')
    end
  end

  private

  def set_course
    @course = Course.find params[:course_id]
  end
end
