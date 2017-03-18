class Testimony < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :description, :title, :picture
  friendly_id :title, use: [:slugged, :history]
  mount_uploader :picture, ImageUploader
end
