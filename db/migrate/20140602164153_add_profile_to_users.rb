class AddProfileToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :phone, :string
  	add_column :users, :cellular, :string
  	add_column :users, :shipping_address, :string
  	add_column :users, :district, :string
  	add_column :users, :postal_code, :string
  	add_column :users, :city, :string
  	add_column :users, :company, :string
  	add_column :users, :cuit, :string
  end
end
