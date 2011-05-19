class JoinWebhookEventsToProducts < ActiveRecord::Migration
  def self.up
    add_column :webhook_events, :product_id, :integer
    add_column :products, :shopify_id, :integer
  end

  def self.down
    remove_column :products, :shopify_id
    remove_column :webhook_events, :product_id
  end
end