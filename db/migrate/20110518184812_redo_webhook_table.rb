class RedoWebhookTable < ActiveRecord::Migration
  def self.up
    drop_table :webhook_events
    create_table :webhook_events do |t|
      t.string :event_type
      t.string :description
    end
    
  end

  def self.down
  end
end
