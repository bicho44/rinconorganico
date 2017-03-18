class AddPublishedToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :is_featured, :boolean, :default => false
    add_column :notes, :published, :boolean, :default => true
  end
end
