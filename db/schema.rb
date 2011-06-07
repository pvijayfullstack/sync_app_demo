# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110526204707) do

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shopify_id"
    t.boolean  "logical_delete"
    t.integer  "shop_id"
  end

  create_table "shops", :force => true do |t|
    t.string   "name"
    t.boolean  "installed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "url"
  end

  create_table "webhook_events", :force => true do |t|
    t.string   "event_type"
    t.text     "description",    :limit => 255
    t.integer  "product_id"
    t.boolean  "logical_delete"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shop_id"
  end

end
