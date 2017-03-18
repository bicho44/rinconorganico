class AddProducerIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :producer_id, :integer
  end
end
