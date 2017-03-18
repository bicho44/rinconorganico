class Product < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :title, :description, :measure, :price, :picture, :published, :category_id, :producer_id, :is_featured, :is_sale
  mount_uploader :picture, ImageUploader

  friendly_id :title, use: [:slugged, :history]
  has_many :cookings
  has_many :recipes, through: :cookings
  belongs_to :producer
  belongs_to :category
  has_many :cart_items

  validates :title, presence: true
  validates :category, presence: true
  validates :price, numericality: true

  #default_scope where(published: :true)
  scope :published, -> {where(published: true)}
  scope :ordered, -> {order('title asc')}
  scope :featured, -> {where(is_featured: true)}
  scope :in_sale, -> {where(is_sale: true)}
  scope :randomize, order('rand()')

  # def in_category_tree(category_id)
  #   category = Category.find(category_id)
  #   category.each()

  def publish!
    self.update_attribute(:published, true)
  end

  def unpublish!
    self.update_attribute(:published, false)
  end

  def self.within_category_tree(category_id)
    category = Category::find(category_id)
    category_ids = category.child_ids.push(category_id)
    where(category_id: category_ids)
  end

  #Replace this with postgress full search!
  def self.search(search)
    if search
      where('title like ? or description like ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
end
