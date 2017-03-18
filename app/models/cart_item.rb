class CartItem < ActiveRecord::Base
  attr_accessible :quantity, :cart, :product_id
  belongs_to :cart
  belongs_to :product

  before_create :default_quantity_to_one

  delegate :picture,
    to: :product

  def unit_price
    product.price
  end

  def full_price
    unit_price*quantity
  end

private

  def default_quantity_to_one
    self.quantity ||=1
  end

end
