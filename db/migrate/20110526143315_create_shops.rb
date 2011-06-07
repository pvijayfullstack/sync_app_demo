class CreateShops < ActiveRecord::Migration
  def self.up
    create_table :shops do |t|
      t.string :name
      t.boolean :installed

      t.timestamps
    end
    
    add_column :products, :shop_id, :integer
    add_column :webhook_events, :shop_id, :integer
  end

  def self.down
    remove_column :webhook_events, :shop_id
    remove_column :products, :shop_id
    drop_table :shops
  end
end