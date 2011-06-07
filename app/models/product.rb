class Product < ActiveRecord::Base
  validates_uniqueness_of :shopify_id
  
  has_many :webhook_events
  belongs_to :shop
end
