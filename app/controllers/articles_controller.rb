class ArticlesController < ApplicationController
  def new
    @articles = Article.order("id DESC")
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    if article.save
      render json: {article: article} 
    end
  end

  private
  def article_params
    params.require(:article).permit(:text)
  end
end
