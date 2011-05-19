class HomeController < ApplicationController
  
  around_filter :shopify_session, :except => 'welcome'
  
  def welcome
    current_host = "#{request.host}#{':' + request.port.to_s if request.port != 80}"
    @callback_url = "http://#{current_host}/login/finalize"
  end
  
  def index
    
    @webhook_events = WebhookEvent.limit(10).order('id DESC')
    @products = Product.all

  end
  
  
  def get_products
    limit = 40
    all_products = Array.new
    products = ShopifyAPI::Product.find(:all, :params => {:limit => limit})
    all_products = all_products.concat products
    puts products.length
    while products.length == limit do
      since_id = products.last.id
      puts since_id
      puts products.length
      products = ShopifyAPI::Product.find(:all, :params => {:limit => limit, :since_id => since_id})
      all_products = all_products.concat products
    end
    all_products
  end
  
end