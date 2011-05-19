class AddingDefaultColumnsToWebhookEvent < ActiveRecord::Migration
  def self.up
    add_column :webhook_events, :created_at, :datetime
    add_column :webhook_events, :updated_at, :datetime
  end

  def self.down
    remove_column :webhook_events, :updated_at
    remove_column :webhook_events, :created_at
  end
end