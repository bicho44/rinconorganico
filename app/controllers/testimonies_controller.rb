class TestimoniesController < ApplicationController

  def index
    @testimonies = Testimony.page(params[:page]).per(3)
  end

  def show
    @testimony = Testimony.find(params[:id])
  end

end