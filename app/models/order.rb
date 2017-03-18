class Order < ActiveRecord::Base
  attr_accessible :first_name,
                  :last_name,
                  :phone,
                  :cellular,
                  :shipping_address,
                  :district,
                  :postal_code, 
                  :city,
                  :company,
                  :cuit,
                  :comments

  validates :first_name,:last_name,:shipping_address,:district,:postal_code,:city,presence: true
  validates_presence_of :phone, :unless => :cellular?
  validates_presence_of :cellular, :unless => :phone?
  has_many :order_items
  belongs_to :user

  after_create :update_user_profile

  delegate :email,
    to: :user

  default_scope order(date_created: :desc)

  def total
    t = 0.0
    order_items.each do |item|
      t += item.full_price
    end
    t
  end

  def update_user_profile 
    if (user.incomplete_profile?)
      user.update_attributes(
        :first_name => self.first_name,
        :last_name => self.last_name,
        :phone => self.phone ,
        :cellular => self.cellular,
        :shipping_address => self.shipping_address ,
        :district => self.district,
        :postal_code => self.postal_code,
        :city => self.city,
        :company => self.company,
        :cuit => self.cuit
      )
    end
  end

end
