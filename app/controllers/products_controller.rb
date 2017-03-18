class ProductsController < ApplicationController
  before_filter :last_recipes

	def show
    @product = Product.published.find(params[:id])
    @category = @product.category
    @categories = Category.all
	end

end
