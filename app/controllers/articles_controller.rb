class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @title=@article.headline
  end

  def index
    @articles = Article.page(params[:page])
    @title="Articles"
  end
end
