class AddPublishedToProducts < ActiveRecord::Migration
  def change
    add_column :products, :published, :boolean, :null => false, :default => true
  end
end
