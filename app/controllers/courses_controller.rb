class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      flash[:notice] = "Coures was updated successfully!"
      redirect_to @course
    else
      render :edit
    end
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = "Coures was created successfully!"
      redirect_to @course
    else
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:notice] = "Course was deleted successfully!"
    redirect_to courses_path
  end

  private

  def course_params
    params.require(:course).permit(:short_name, :name, :description)
  end
end
