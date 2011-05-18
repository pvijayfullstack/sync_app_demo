class WebhookController < ApplicationController

  def product_new
    product = ActiveSupport::JSON.decode(request.body)
    puts product.id
  end

  def product_updated
    product = ActiveSupport::JSON.decode(request.body)
    logger.fatal product
    db_product = Product.new(:name => product[:title])
    db_product.save
  end

  def product_deleted
    product = ActiveSupport::JSON.decode(request.body)
    puts product.id
  end

end
