class RenameGeneralConfigTable < ActiveRecord::Migration
  def up
    #rename_table :general_config, :banner
  end

  def down
    #rename_table :banner, :general_config
  end
end
