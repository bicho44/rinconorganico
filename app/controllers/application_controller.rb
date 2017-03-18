# encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_cart
  before_filter :set_locale

protected
  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: lambda { |exception| render_error 500, exception }
    rescue_from ActionController::RoutingError, ActionController::UnknownController, ::AbstractController::ActionNotFound, ActiveRecord::RecordNotFound, with: lambda { |exception| render_error 404, exception }
  end

  private
  def render_error(status, exception)
    respond_to do |format|
      format.html { render template: "errors/error_#{status}", layout: 'layouts/application', status: status }
      format.all { render nothing: true, status: status }
    end
    logger.info "Error: #{exception.inspect}"
  end

  def last_recipes
    @last_recipes ||= Recipe.limit(4).order('id desc')
  end

  def set_locale
    I18n.locale = :es #Default
  end

  def current_cart
    @current_cart ||= (Cart.find_by_id(session[:current_cart_id]) if session[:current_cart_id])
    unless @current_cart
      @current_cart = Cart.create!
      session[:current_cart_id] = @current_cart.id
    end
    @current_cart
  end

  def session_cart
    return @session_cart if defined?(@session_cart)
    session_cart!
  end
  # use this method if you want to force a SQL query to get the cart.
  def session_cart!
    if cookies[:cart_id]
      @session_cart = Cart.find_by_id(cookies[:cart_id])
      unless @session_cart
        @session_cart = Cart.create(:user_id => current_user_id)
        cookies[:cart_id] = @session_cart.id
      end
    elsif current_user && current_user.current_cart
      @session_cart = current_user.current_cart
      cookies[:cart_id] = @session_cart.id
    else
      @session_cart = Cart.create
      cookies[:cart_id] = @session_cart.id
    end

    return @session_cart
  end

end
