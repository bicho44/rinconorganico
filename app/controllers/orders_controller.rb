class OrdersController < ApplicationController
  before_filter :require_login

  def new
    @order = Order.new

    if (!current_user.incomplete_profile?) 
      @order.first_name = current_user.first_name
      @order.last_name = current_user.last_name
      @order.phone = current_user.phone 
      @order.cellular = current_user.cellular
      @order.shipping_address = current_user.shipping_address 
      @order.district = current_user.district
      @order.postal_code = current_user.postal_code
      @order.city = current_user.city
      @order.company = current_user.company
      @order.cuit = current_user.cuit
    end

    last_order = Order.where(user_id: current_user.id).last
    if last_order
      @order = last_order.dup
      @order.id = @order.created_at = @order.updated_at = nil
    end
  end

  def create
    @order = Order.new(params[:order])
    @order.user_id = current_user.id
    if @order.save
      current_cart.cart_items.each do |item|
        @order.order_items.create!(price: item.product.price, product_id: item.product_id, quantity: item.quantity)
      end
      current_cart.destroy

      OrderMailer.client_email(@order).deliver rescue puts( 'do nothing...  dont blow up over an order conf email')
      OrderMailer.admin_email(@order).deliver rescue puts( 'do nothing...  dont blow up over an order conf email')
      
      redirect_to orders_success_path, notice: 'El pedido fue generado correctamente!'
    else
      flash.now[:error] = "Algunos campos son incorrectos"
      render action: :new
    end
  end

  def success 

  end

  def require_login
    unless current_user
      session[:user_return_to] = new_order_path
      redirect_to new_user_session_path, notice: I18n.t('login_necessary_for_checkout')
    end
  end

end