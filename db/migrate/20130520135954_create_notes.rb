class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description
      t.string :picture
      t.string :type

      t.timestamps
    end
  end
end
