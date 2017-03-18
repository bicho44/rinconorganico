class RecipesController < ApplicationController
  before_filter :last_recipes
  
  def index
    @recipes = Recipe.search(params[:search]).page(params[:page]).per(4)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

end
