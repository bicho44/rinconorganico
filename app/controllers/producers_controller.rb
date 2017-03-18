class ProducersController < ApplicationController

  def index
    @producers = Producer.page(params[:page]).per(3)
  end

  def show
    @producer = Producer.find(params[:id])
  end
end
