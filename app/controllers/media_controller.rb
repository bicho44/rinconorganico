class MediaController < ApplicationController

  def index
    @notes = Note.medium.published.page(params[:page]).per(5)
  end

  def show
    @note = Note.medium.find(params[:id])
  end

end