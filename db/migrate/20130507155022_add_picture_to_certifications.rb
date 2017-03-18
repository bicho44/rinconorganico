class AddPictureToCertifications < ActiveRecord::Migration
  def change
    add_column :certifications, :picture, :string
  end
end
