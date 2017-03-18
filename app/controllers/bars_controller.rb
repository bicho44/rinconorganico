class BarsController < ApplicationController

  def index
    @notes = Note.bar.published.page(params[:page]).per(5)
  end

	def show
    @note = Note.bar.find(params[:id])
	end

end
