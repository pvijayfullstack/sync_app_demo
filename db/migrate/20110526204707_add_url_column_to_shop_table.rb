class AddUrlColumnToShopTable < ActiveRecord::Migration
  def self.up
    add_column :shops, :url, :text
  end

  def self.down
    remove_column :shops, :url
  end
end