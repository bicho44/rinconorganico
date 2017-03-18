class ContactMailer < ActionMailer::Base
  
	def contact_us(message)
		@message = message
		mail(
      :from => message.email,
      :to=> 'info@elrinconorganico.com.ar', 
      :reply_to => message.email,
      :subject=> "Consulta desde el sitio"
    )
	end
  
end
