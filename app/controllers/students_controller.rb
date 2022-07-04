class StudentsController < ApplicationController
  def index
    @students = User.all
  end

  def show
    @student = User.find(params[:id])
  end

  def teacher_info
    @teacher = User.where(admin: true)
  end
end
