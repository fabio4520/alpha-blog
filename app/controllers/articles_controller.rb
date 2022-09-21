class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(permitted_params)
    if @article.valid?
      @article.save
      flash[:notice] = "Article created successfully pes mano uwu"
      redirect_to articles_path
    else
      flash[:alert] = @article.errors.full_messages.join(', ')
      render 'articles/new'
    end
  end

  private

  def permitted_params
    params.require(:article).permit(:title, :description)
  end

end
