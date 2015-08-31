class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.all.order('created_at DESC')    
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.create(article_params)

    if @article.save
      redirect_to @article, notice: "New article created!"
    else
      render 'new'
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    @article = current_user.articles.find(params[:id])
    @article.update(article_params)

    if @article.save
      redirect_to @article, notice: "Changes to article saved!"
    else
      render 'edit'
    end
  end

  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy

    redirect_to root_path, notice: "Article was successfully deleted!"
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
