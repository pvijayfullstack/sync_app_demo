class WebhookController < ApplicationController

  def product_new
    data = ActiveSupport::JSON.decode(request.body)
    product = Product.new(:name => data["title"], :shopify_id => data["id"])
    product.save
    event = WebhookEvent.new(:event_type => "product new", :product => product)
    event.save
    render :status => 200
  end

  def product_updated
    data = ActiveSupport::JSON.decode(response.body)
    product = Product.where('shopify_id = ?', data["id"])
    if product != nil
      product.name = data["title"]
      product.save
      event = WebhookEvent.new(:event_type => "product update", :product => product)
      event.save
    end
    render :status => 200
  end

  def product_deleted
    data = ActiveSupport::JSON.decode(response.body)
    product = Product.where('shopify_id = ?', data["id"])
    product.logical_delete = true
    product.save
    event = WebhookEvent.new(:event_type => "product delete", :product => product)
    event.save
    render :status => 200
  end

end
