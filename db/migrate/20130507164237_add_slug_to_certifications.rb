class AddSlugToCertifications < ActiveRecord::Migration
  def change
    add_column :certifications, :slug, :string
    add_index :certifications, :slug
  end
end
