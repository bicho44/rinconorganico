class AlterPricePrecisionProducts < ActiveRecord::Migration
  def up
    change_column :products, :price, :decimal, precision: 14, scale: 2
  end

  def down
  end
end