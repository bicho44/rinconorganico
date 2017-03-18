class CartItemsController < ApplicationController
  def create
    current_cart.cart_items.create!(params[:cart_item])
    session[:last_product_page] = request.env['HTTP_REFERER'] || products_url
    redirect_to current_cart_url, notice: "Product added to cart"
  end

  def destroy
    current_cart.cart_items.find(params[:id]).destroy
    redirect_to current_cart_url, notice: 'Product removed from cart'
  end
end