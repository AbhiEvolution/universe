class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_user, except: [:index, :show, :new, :create]

  def index
    @articles = Article.page params[:page]
    #@articles = Article.all
    @categories = Category.all
    @users_all = User.all_except(current_user)
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article updated successfully!"
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      flash[:notice] = "Article created successfully!"
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article deleted successfully!"
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def set_user
    if (current_user.id != @article.user.id) && !current_user.admin?
      flash[:alert] = "You are not able to perform this action."
      redirect_to articles_path
    end
  end
end
