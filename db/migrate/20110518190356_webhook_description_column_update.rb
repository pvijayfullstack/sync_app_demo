class WebhookDescriptionColumnUpdate < ActiveRecord::Migration
  def self.up
    change_column :webhook_events, :description, :text
  end

  def self.down
    change_column :webhook_events, :description, :string
  end
end