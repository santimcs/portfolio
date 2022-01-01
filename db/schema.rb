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

ActiveRecord::Schema.define(version: 20210507075249) do

  create_table "buys", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "stock_id"
    t.date    "date"
    t.integer "qty"
    t.decimal "price",    precision: 5,  scale: 2
    t.decimal "fee",      precision: 7,  scale: 2
    t.decimal "vat",      precision: 6,  scale: 2
    t.string  "status"
    t.decimal "net",      precision: 10, scale: 2
    t.string  "kind"
    t.string  "chart"
  end

  create_table "categories", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name"
    t.decimal "sequence", precision: 10
  end

  create_table "cover_buys", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "short_sell_id"
    t.date     "date"
    t.decimal  "price",         precision: 6,  scale: 2
    t.decimal  "fee",           precision: 7,  scale: 2
    t.decimal  "vat",           precision: 6,  scale: 2
    t.decimal  "net",           precision: 10, scale: 2
    t.integer  "days"
    t.decimal  "profit",        precision: 8,  scale: 2
    t.decimal  "percent",       precision: 9,  scale: 5
    t.decimal  "yearly",        precision: 9,  scale: 5
    t.integer  "sequence"
    t.string   "chart"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["short_sell_id"], name: "index_cover_buys_on_short_sell_id", using: :btree
  end

  create_table "dividends", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "stock_id"
    t.string  "name"
    t.integer "year"
    t.integer "quarter"
    t.integer "number"
    t.decimal "ppu",      precision: 8, scale: 6
    t.decimal "amt",      precision: 8, scale: 2
    t.decimal "net",      precision: 8, scale: 2
    t.date    "x_date"
    t.date    "p_date"
  end

  create_table "sells", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "buy_id"
    t.date    "date"
    t.decimal "price",       precision: 5,  scale: 2
    t.decimal "fee",         precision: 7,  scale: 2
    t.decimal "vat",         precision: 6,  scale: 2
    t.decimal "net",         precision: 10, scale: 2
    t.integer "days"
    t.decimal "profit",      precision: 8,  scale: 2
    t.decimal "percent",     precision: 9,  scale: 5
    t.decimal "yearly",      precision: 11, scale: 5
    t.integer "sequence"
    t.string  "chart"
    t.integer "dividend_id",                          default: 0
  end

  create_table "short_sells", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "stock_id"
    t.date     "date"
    t.integer  "qty"
    t.decimal  "price",      precision: 6,  scale: 2
    t.decimal  "fee",        precision: 7,  scale: 2
    t.decimal  "vat",        precision: 6,  scale: 2
    t.decimal  "net",        precision: 10, scale: 2
    t.string   "kind"
    t.string   "chart"
    t.string   "status"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["stock_id"], name: "index_short_sells_on_stock_id", using: :btree
  end

  create_table "stocks", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name"
    t.integer "category_id"
    t.string  "website"
  end

end
