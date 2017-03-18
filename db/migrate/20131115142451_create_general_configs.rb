class CreateGeneralConfigs < ActiveRecord::Migration
  def change
    create_table :general_configs do |t|
      t.integer :banner_recipe_id
      t.integer :banner_product_id

      t.timestamps
    end
  end
end
