class Certification < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :description, :title, :picture
  mount_uploader :picture, ImageUploader
  friendly_id :title, use: [:slugged, :history]
end
