class Note < ActiveRecord::Base
  self.inheritance_column = 'something_different_than_type' #to avoid STI conventions in the way

  extend FriendlyId
  attr_accessible :description, :picture, :title, :type, :remote_picture_url, :created_at, :published, :is_featured
  mount_uploader :picture, ImageUploader
  friendly_id :title, use: [:slugged, :history]

  validates :title, presence: true
  validate :valid_type

  @@types = %w(bar catering blog medium)
  @@types.each do |type|
    scope type, -> {where('type =?', type)}
  end
  scope :published, -> {where(published: true)}
  scope :featured, -> {where(is_featured: true)}
  scope :home, -> {published.featured.limit(3)}

  def related
    self.class.where('type=?',type).limit(3)
  end

  def valid_type
    errors.add(:type, 'is not valid') if ! @@types.include?(type)
  end

  #Replace this with postgress full search!
  def self.search(search)
    if search
      where('title like ? or description like ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end

  def self.types
    @@types
  end

end
