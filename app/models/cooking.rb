class Cooking < ActiveRecord::Base
  attr_accessible :product_id, :recipe_id
  belongs_to :recipe
  belongs_to :product
end
