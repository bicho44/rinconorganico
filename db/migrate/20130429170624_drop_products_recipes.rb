class DropProductsRecipes < ActiveRecord::Migration
  def up
    drop_table :products_recipes
  end

  def down
  end
end
