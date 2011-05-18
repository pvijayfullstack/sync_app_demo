class WebhookTypeColumnNameChange < ActiveRecord::Migration
  def self.up
    change_column :webhook_events, :type, :event_type
  end

  def self.down
    change_column :webhook_events, :event_type, :type
  end
end