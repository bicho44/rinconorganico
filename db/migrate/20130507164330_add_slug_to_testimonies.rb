class AddSlugToTestimonies < ActiveRecord::Migration
  def change
    add_column :testimonies, :slug, :string
    add_index :testimonies, :slug
  end
end
