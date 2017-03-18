class Cart < ActiveRecord::Base
  attr_accessible :user_id, :user, :cart_items_attributes
  belongs_to :user

  has_many :cart_items
  has_many :products, through: :cart_items

  accepts_nested_attributes_for :cart_items

  def total_price
    cart_items.to_a.sum(&:full_price)
  end

  def total_items
    cart_items.count
  end

end
