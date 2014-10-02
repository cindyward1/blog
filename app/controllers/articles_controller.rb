class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article_params])
    @article.title = params[:article][:title]
    @article.content = params[:article][:content]
    if @article.save
      flash[:notice] = "New article created."
      redirect_to articles_path
    else
      render 'new'
    end
  end
end
