class CreateWebhookEvents < ActiveRecord::Migration
  def self.up
    create_table :webhook_events do |t|
      t.string :type
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :webhook_events
  end
end
