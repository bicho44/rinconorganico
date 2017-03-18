class ContactController < ApplicationController

  def create
    @message = Message.new(params[:message]) 
    if @message.valid?
      ContactMailer.contact_us(@message).deliver rescue puts('do nothing... contact mail failed')
    end
    
    respond_to do |format| 
      format.js
      format.html do
        if @message.valid?
          notice = 'El mensaje fue enviado exitosamente'
          redirect_to root_path, notice: notice
        else
          flash.now[:error] = "Algunos campos son incorrectos"
          render :new
        end
      end
    end
  end

  def new
    @message = Message.new
  end

end