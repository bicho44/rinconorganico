class AddToOrders < ActiveRecord::Migration
  
  def change
    add_column :orders, :city, :string
    add_column :orders, :postal_code, :string
    add_column :orders, :phone, :string
  end
end
