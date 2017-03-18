class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "[#{message.to}] #{message.subject}"
    message.to = "juan@elrinconorganico.com.ar"
    message.cc = "juan@elrinconorganico.com.ar" if message.cc
    message.bcc = "juan@elrinconorganico.com.ar" if message.bcc
  end
end