# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20150215064153) do

  create_table "buys", :force => true do |t|
    t.integer "stock_id"
    t.date    "date"
    t.integer "qty"
    t.decimal "price",    :precision => 5,  :scale => 2
    t.decimal "fee",      :precision => 7,  :scale => 2
    t.decimal "vat",      :precision => 6,  :scale => 2
    t.string  "status"
    t.decimal "net",      :precision => 10, :scale => 2
    t.string  "kind"
    t.string  "chart"
  end

  create_table "buys_view", :id => false, :force => true do |t|
    t.string  "NAME"
    t.date    "date"
    t.integer "qty"
    t.decimal "price", :precision => 5,  :scale => 2
    t.decimal "fee",   :precision => 7,  :scale => 2
    t.decimal "vat",   :precision => 6,  :scale => 2
    t.decimal "net",   :precision => 10, :scale => 2
  end

  create_table "categories", :force => true do |t|
    t.string  "name"
    t.decimal "sequence", :precision => 10, :scale => 0
  end

  create_table "most_often_sells_stock", :id => false, :force => true do |t|
    t.string  "KIND"
    t.string  "NAME"
    t.integer "TIMES",       :limit => 8,                                :default => 0, :null => false
    t.decimal "SUM(PROFIT)",              :precision => 30, :scale => 2
  end

  create_table "profit_by_kind", :id => false, :force => true do |t|
    t.string  "KIND"
    t.decimal "SUM(PROFIT)", :precision => 30, :scale => 2
  end

  create_table "profit_by_month", :id => false, :force => true do |t|
    t.integer "MONTH (sells.DATE)"
    t.string  "KIND"
    t.string  "FORMAT(SUM(PROFIT), 2)", :limit => 42
  end

  create_table "sells", :force => true do |t|
    t.integer "buy_id"
    t.date    "date"
    t.decimal "price",    :precision => 5,  :scale => 2
    t.decimal "fee",      :precision => 7,  :scale => 2
    t.decimal "vat",      :precision => 6,  :scale => 2
    t.decimal "net",      :precision => 10, :scale => 2
    t.integer "days"
    t.decimal "profit",   :precision => 8,  :scale => 2
    t.decimal "percent",  :precision => 9,  :scale => 5
    t.decimal "yearly",   :precision => 9,  :scale => 5
    t.integer "sequence"
    t.string  "chart"
  end

  create_table "stocks", :force => true do |t|
    t.string  "name"
    t.integer "category_id"
    t.string  "website"
  end

end
