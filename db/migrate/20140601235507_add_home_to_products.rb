class AddHomeToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :is_sale, :boolean, :default => false
  end
end
