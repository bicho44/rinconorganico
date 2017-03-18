class AddSlugToProducers < ActiveRecord::Migration
  def change
    add_column :producers, :slug, :string
  end
end
