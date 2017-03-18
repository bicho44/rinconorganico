class CateringsController < ApplicationController
  # before_filter :last_recipes

  def index
    @notes = Note.catering.published.page(params[:page]).per(3)
  end

	def show
    @note = Note.catering.find(params[:id])
	end

end
