class NewsletterSubscription < ActiveRecord::Base
  attr_accessible :email
  validate :validate_email

private
  def validate_email
    errors.add(:email, 'Email invalido') unless email =~ /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i
  end
end
