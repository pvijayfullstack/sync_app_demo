class WebhookController < ApplicationController

def product_new
  product = ActiveSupport::JSON.decode(request.body)
  puts product
end

def product_updated
product = ActiveSupport::JSON.decode(request.body)
puts product
end

def product_deleted
product = ActiveSupport::JSON.decode(request.body)
puts product
end

end
