class WebhookController < ApplicationController

  def product_new
    product = ActiveSupport::JSON.decode(request.body)
    puts product.id
  end

  def product_updated
    product = ActiveSupport::JSON.decode(request.body)
    db_product = Product.new(:name => product.name, :price => product.variants[0].price)
    db_product.save
  end

  def product_deleted
    product = ActiveSupport::JSON.decode(request.body)
    puts product.id
  end

end
