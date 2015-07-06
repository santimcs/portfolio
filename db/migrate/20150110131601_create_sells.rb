class CreateSells < ActiveRecord::Migration
  def change
    create_table :sells do |t|
  t.integer :buy_id
  t.date :date
  t.decimal :price, precision: 5, scale: 2
  t.decimal :fee, precision: 7, scale: 2
  t.decimal :vat, precision: 6, scale: 2
  t.decimal :net, precision: 10, scale: 2
  t.integer :days
  t.decimal :profit, precision: 8, scale: 2
  t.decimal :percent, precision: 5, scale: 5

    end
  end
end
