class AddFieldsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :cellular, :string
    add_column :orders, :district, :string
    add_column :orders, :company, :string
    add_column :orders, :cuit, :string
  end
end
