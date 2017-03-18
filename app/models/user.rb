class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                  :first_name, :last_name, :phone, :cellular, :shipping_address,
                  :district, :postal_code, :city, :company, :cuit

  # attr_accessible :title, :body

  has_many :carts, :dependent => :destroy


  def current_cart
    carts.last
  end

  def incomplete_profile?
    self.first_name.blank? and self.last_name.blank? and self.shipping_address.blank?
  end


end
