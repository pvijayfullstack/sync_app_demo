class WebhookController < ApplicationController

  def product_new
    data = ActiveSupport::JSON.decode(request.body)
    if Product.where('shopify_id = ?', data["id"]).first == nil
      event = WebhookEvent.new(:event_type => "product new")
      event.save
      product = Product.new(:name => data["title"], :shopify_id => data["id"])
      product.webhook_events << event
      product.save
    end
    render_success
  end

  def product_updated
    data = ActiveSupport::JSON.decode(request.body)
    product = Product.where('shopify_id = ?', data["id"]).first
    if product != nil
      event = WebhookEvent.new(:event_type => "product update")
      event.save
      product.name = data["title"]
      product.webhook_events << event
      product.save
    end
    render_success
  end

  def product_deleted
    data = ActiveSupport::JSON.decode(request.body)
    if Product.where('shopify_id = ?', data["id"]).first != nil
      event = WebhookEvent.new(:event_type => "product delete")
      event.save
      product = Product.where('shopify_id = ?', data["id"]).first
      product.logical_delete = true
      product.webhook_events << event
      product.save
    end
    render_success
  end

end
