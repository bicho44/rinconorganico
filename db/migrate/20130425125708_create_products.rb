class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :measure
      t.string :picture
      t.timestamps
    end
  end
end
