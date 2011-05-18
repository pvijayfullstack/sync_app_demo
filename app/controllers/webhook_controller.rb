class WebhookController < ApplicationController

  def product_new
    event = webhook_event.new(:type => "product new", :description => request.body)
    event.save
  end

  def product_updated
    event = webhook_event.new(:type => "product update", :description => request.body)
    event.save
  end

  def product_deleted
    event = webhook_event.new(:type => "product delete", :description => request.body)
    event.save
  end

end
