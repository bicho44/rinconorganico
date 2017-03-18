class Category < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :title, :parent_id
  has_ancestry

  has_many :products

  friendly_id :title, use: [:slugged, :history]
  validates :title, presence: true

end
