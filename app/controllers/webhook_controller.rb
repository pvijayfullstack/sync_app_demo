class WebhookController < ApplicationController

  def product_new
    event = WebhookEvent.new(:type => "product new", :description => request.body)
    event.save
  end

  def product_updated
    event = WebhookEvent.new(:type => "product update", :description => request.body)
    event.save
  end

  def product_deleted
    event = WebhookEvent.new(:type => "product delete", :description => request.body)
    event.save
  end

end
