class UsersController < ApplicationController
  def index
    #@users = User.all
    @users = User.page params[:page]
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  private

  # def required_user
  #   if !user_signed_in?
  #     flash[:alert] = "You must be logged in to perform this action."
  #     redirect_to new_user_session_path
  #   end
  # end
end
