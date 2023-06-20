class ArticlesController < ApplicationController
  def new
    @articles = Article.order("id DESC")
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    if article.save
      redirect_to new_article_url
    end
  end

  private
  def article_params
    params.require(:article).permit(:text)
  end
end
