class LessonsController < ApplicationController
  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to @lesson
    else
      flash[:alert] = @lesson.errors.full_messages
      redirect_to root_path
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.assign_attributes(lesson_params)
    if @lesson.save
      redirect_to @lesson
    else
      flash[:alert] = @lesson.errors.full_messages
      redirect_to root_path
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    flash[:notice] = "Lesson has been deleted."
    redirect_to root_path

  end

  private

  def lesson_params
    params.require(:lesson).permit(:title,:body)
  end

end