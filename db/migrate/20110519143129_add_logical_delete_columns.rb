class AddLogicalDeleteColumns < ActiveRecord::Migration
  def self.up
    add_column :products, :logical_delete, :boolean
    add_column :webhook_events, :logical_delete, :boolean
  end

  def self.down
    remove_column :webhook_events, :logical_delete
    remove_column :products, :logical_delete
  end
end