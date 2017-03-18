class PostsController < ApplicationController

  before_filter :more_read

  def index
    @notes = Note.blog.published.search(params[:search]).page(params[:page]).per(3).order(:'created_at desc')
  end

	def show
    @note = Note.blog.find(params[:id])
	end

  protected

    def more_read
      @more_read = @note = Note.blog.published.limit(5)
    end

end
