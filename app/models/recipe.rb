class Recipe < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :description, :picture, :title, :cookings_attributes
  mount_uploader :picture, ImageUploader

  friendly_id :title, use: [:slugged, :history]
  has_many :cookings
  has_many :products, through: :cookings
  accepts_nested_attributes_for :cookings, :allow_destroy => true
  # has_and_belongs_to_many :products

  #Like search? Hmmm... to be improved. See sphinx, or easier postgresql search :)
  def self.search(search)
    if search
      where('title like ? or description like ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end


end
