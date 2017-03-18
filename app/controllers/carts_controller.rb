class CartsController < ApplicationController

  def show
  end

  def update
    #raise params.inspect
    current_cart.update_attributes(params[:cart]) if (params[:cart])

    redirect_to current_cart_path
  end

end