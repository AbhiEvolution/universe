class StudentCoursesController < ApplicationController
  def create()
    course_to_add = Course.find(params[:course_id])
    unless current_user.courses.include?(course_to_add)
      StudentCourse.create(course: course_to_add, user: current_user)
      flash[:notice] = "You have successfully enrolled in #{course_to_add.name}"
      redirect_to student_path(current_user)
    else
      flash[:notice] = "Something gone wrong with your enrollment"
    end
  end
end
