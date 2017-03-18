class CreateCookings < ActiveRecord::Migration
  def change
    create_table :cookings do |t|
      t.integer :recipe_id
      t.integer :product_id
      t.timestamps
    end
  end

end
