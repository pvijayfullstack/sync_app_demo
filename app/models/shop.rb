class Shop < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :products
  has_many :webhook_events
end
