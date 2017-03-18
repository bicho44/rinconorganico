class RemoveUnusedFieldsFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :number
    remove_column :orders, :email
  end

  def down
  end
end
