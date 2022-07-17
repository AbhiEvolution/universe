class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :show]
  before_action :set_user, except: [:index, :show]

  def index
    @categories = Category.page params[:page]
    @users_all = User.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category was updated successfully!"
      redirect_to @category
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was created successfully!"
      redirect_to @category
    else
      render "new"
    end
  end

  def show
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_user
    if !current_user.admin?
      flash[:alert] = "You are not able to perform this action."
      redirect_to categories_path
    end
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
