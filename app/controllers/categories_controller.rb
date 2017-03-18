class CategoriesController < ApplicationController
  before_filter :last_recipes

  def show
    @categories = Category.scoped
    @category = Category.find(params[:id])
    @products = Product.published.within_category_tree(@category.id).ordered.search(params[:search]).page(params[:page]).per(6)

    @slats_view = true
  end

  def index
    @categories = Category.all
    if params[:search]
      @slats_view = true
      @products = Product.published.ordered.search(params[:search]).page(params[:page]).per(6)
    else
      @products = Product.published.ordered.page(params[:page]).per(6)
    end
  end
  
end