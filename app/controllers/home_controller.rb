class HomeController < ApplicationController
  
  around_filter :shopify_session, :except => 'welcome'
  
  def welcome
    current_host = "#{request.host}#{':' + request.port.to_s if request.port != 80}"
    @callback_url = "http://#{current_host}/login/finalize"
  end
  
  def index
    if Shop.where(:name => ShopifyAPI::Shop.current.name).exists?
      session[:shop] = Shop.where(:name => ShopifyAPI::Shop.current.name).first
    else    
      shop = Shop.new(:name => ShopifyAPI::Shop.current.name, :url => "http://#{ShopifyAPI::Shop.current.domain}", :installed => true)
      shop.save
      session[:shop] = shop
      init_webhooks
      get_products shop
    end
    
    @webhook_events = WebhookEvent.limit(10).order('id DESC')
    @products = Product.where(:logical_delete => nil, :shop_id => session[:shop].id)
  end
  
  private
  
  def get_products(shop)
    limit = 250
    all_products = Array.new
    products = ShopifyAPI::Product.find(:all, :params => {:limit => limit})
    all_products = all_products.concat products
    puts products.length
    while products.length == limit do
      since_id = products.last.id
      products = ShopifyAPI::Product.find(:all, :params => {:limit => limit, :since_id => since_id})
      all_products = all_products.concat products
    end
    
    all_products.each do |product|
      unless Product.where('shopify_id = ?', product.id).exists?
        Product.new(:name => product.title, :shopify_id => product.id, :shop => shop).save
      end
    end
  end
  
  def init_webhooks
    topics = ["products/create", "products/update", "products/delete"]
    
    topics.each do |topic|
      webhook = ShopifyAPI::Webhook.create(:format => "json", :topic => topic, :address => "http://#{DOMAIN_NAMES[RAILS_ENV]}/webhooks/#{topic}")
      raise "Webhook invalid: #{webhook.errors}" unless webhook.valid?
    end
  end
  
end