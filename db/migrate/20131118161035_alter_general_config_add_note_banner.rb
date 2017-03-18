class AlterGeneralConfigAddNoteBanner < ActiveRecord::Migration
  def up
    add_column :general_configs, :banner_blog_id, :integer
  end

  def down
    remove_column :general_configs, :banner_blog_id
  end
end
