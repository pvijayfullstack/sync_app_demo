class Product < ActiveRecord::Base
  validates_uniqueness_of :shopify_id
end
