class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show; end

  def create
    @article = Article.new(permitted_params)
    if @article.save
      flash[:notice] = "Article created successfully pes mano uwu"
      redirect_to @article
    else
      flash[:notice] = "Pipipi"
      flash[:alert] = @article.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def edit; end

  def update
    if @article.update(permitted_params)
      flash[:notice] = "Article updated successfully pes mano uwu"
      redirect_to @article
    else
      flash[:notice] = "Pipipi"
      flash[:alert] = @article.errors.full_messages.join(', ')
      render 'edit'
    end
  end

  def destroy
    if @article.delete
      redirect_to articles_path
    else
      flash[:alert] = @article.errors.full_messages.join(', ')
    end
  end

  private

  def permitted_params
    params.require(:article).permit(:title, :description)
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
