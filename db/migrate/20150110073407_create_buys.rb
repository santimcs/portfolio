class CreateBuys < ActiveRecord::Migration
  def change
    create_table :buys do |t|
  t.integer :stock_id
  t.date :date
  t.integer :qty
  t.decimal :price, precision: 5, scale: 2
  t.decimal :fee, precision: 7, scale: 2
  t.decimal :vat, precision: 6, scale: 2
  t.string :status

    end
  end
end
