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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200515162422) do

  create_table "order_items", force: :cascade do |t|
    t.integer  "purchase_order_id"
    t.string   "item_title"
    t.string   "item_description"
    t.integer  "item_quantity"
    t.decimal  "item_price"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["purchase_order_id"], name: "index_order_items_on_purchase_order_id"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.string   "client_number"
    t.string   "delivery_address"
    t.string   "delivery_city"
    t.string   "delivery_country"
    t.decimal  "delivery_fee"
    t.decimal  "total"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
