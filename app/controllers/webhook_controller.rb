class WebhookController < ApplicationController

  def product_new
    event = WebhookEvent.new(:event_type => "product new", :description => request.body.to_s)
    event.save
  end

  def product_updated
    event = WebhookEvent.new(:event_type => "product update", :description => request.body.to_s)
    event.save
  end

  def product_deleted
    event = WebhookEvent.new(:event_type => "product delete", :description => request.body.to_s)
    event.save
  end

end
