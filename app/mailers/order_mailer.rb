class OrderMailer < ActionMailer::Base
  default :from => 'pedidos@elrinconorganico.com.ar'

	def client_email(order)
		@order = order

    attachments.inline['logo.jpg'] = File.read(Rails.root.join('app','assets','images','email',"logo.jpg"))
    attachments.inline['cliente.jpg'] = File.read(Rails.root.join('app','assets','images','email',"cliente.jpg"))
    attachments.inline['contacto.jpg'] = File.read(Rails.root.join('app','assets','images','email',"contacto.jpg"))
    attachments.inline['notas.jpg'] = File.read(Rails.root.join('app','assets','images','email',"notas.jpg"))
    attachments.inline['pago.jpg'] = File.read(Rails.root.join('app','assets','images','email',"pago.jpg"))
    attachments.inline['pedido.jpg'] = File.read(Rails.root.join('app','assets','images','email',"pedido.jpg"))
    attachments.inline['productos.jpg'] = File.read(Rails.root.join('app','assets','images','email',"productos.jpg"))

		mail(:to=> @order.email, :subject=> "Tu pedido en El Rincon Organico")
	end

  def admin_email(order)
    @order = order

    attachments.inline['logo.jpg'] = File.read(Rails.root.join('app','assets','images','email',"logo.jpg"))
    attachments.inline['cliente.jpg'] = File.read(Rails.root.join('app','assets','images','email',"cliente.jpg"))
    attachments.inline['contacto.jpg'] = File.read(Rails.root.join('app','assets','images','email',"contacto.jpg"))
    attachments.inline['notas.jpg'] = File.read(Rails.root.join('app','assets','images','email',"notas.jpg"))
    attachments.inline['pago.jpg'] = File.read(Rails.root.join('app','assets','images','email',"pago.jpg"))
    attachments.inline['pedido.jpg'] = File.read(Rails.root.join('app','assets','images','email',"pedido.jpg"))
    attachments.inline['productos.jpg'] = File.read(Rails.root.join('app','assets','images','email',"productos.jpg"))

    mail(:to=> 'pedidos@elrinconorganico.com.ar', :subject=> "Pedido desde el sitio")
  end

end
