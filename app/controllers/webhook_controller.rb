class WebhookController < ApplicationController

  def product_new
    event = WebhookEvent.new(:event_type => "product new", :description => ActiveSupport::JSON.decode(request.body).to_s)
    event.save
  end

  def product_updated
    event = WebhookEvent.new(:event_type => "product update", :description => ActiveSupport::JSON.decode(request.body).to_s)
    event.save
  end

  def product_deleted
    event = WebhookEvent.new(:event_type => "product delete", :description => ActiveSupport::JSON.decode(request.body).to_s)
    event.save
  end

end
