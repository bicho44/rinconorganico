ActionMailer::Base.smtp_settings = {
  :address              => "mail.elrinconorganico.com.ar",
  # :port                 => 465,
  :domain               => "mail.elrinconorganico.com.ar",
  :user_name            => "pedidos@elrinconorganico.com.ar",
  :password             => "qweasd",
  :authentication       => "plain",
  :enable_starttls_auto => false
}
require 'development_mail_interceptor' #add this line
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?