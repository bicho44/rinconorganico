class Producer < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :description, :picture, :title
  mount_uploader :picture, ImageUploader
  friendly_id :title, use: [:slugged, :history]
end
