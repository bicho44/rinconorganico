class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number
      t.string :email
      t.string :shipping_address

      t.timestamps
    end
  end
end
