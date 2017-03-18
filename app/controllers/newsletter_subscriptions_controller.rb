class NewsletterSubscriptionsController < ApplicationController
  def create
    @newsletter_subscription = NewsletterSubscription.new(params[:newsletter_subscription])
    if @newsletter_subscription.save
      redirect_to root_path, notice: 'Gracias! Ahora estas suscripto a nuestro newsletter'
    else
      flash[:error] = "Verifica los errores en el formulario, por favor"
      render :new
    end
  end

  def new
    @newsletter_subscription = NewsletterSubscription.new()
  end
end
