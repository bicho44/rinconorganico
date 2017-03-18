class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :price, :product_id, :quantity

  belongs_to :product
  belongs_to :order

  delegate :title,
    to: :product

  def full_price
    price*quantity
  end

end
