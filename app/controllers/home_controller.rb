class HomeController < ApplicationController

  def index
    @products = Product.published.featured.randomize.limit(2)
    @recipes = Recipe.limit(3)
    @testimonies = Testimony.limit(3)
    @posts = Note.blog.home
  end

end