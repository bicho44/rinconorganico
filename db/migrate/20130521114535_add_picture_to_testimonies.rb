class AddPictureToTestimonies < ActiveRecord::Migration
  def change
    add_column :testimonies, :picture, :string
  end
end
