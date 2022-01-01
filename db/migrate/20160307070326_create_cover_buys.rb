class CreateCoverBuys < ActiveRecord::Migration
  def change
    create_table :cover_buys do |t|
      t.references :short_sell
      t.date :date
      t.decimal :price, precision: 6,  scale: 2
      t.decimal :fee,   precision: 7,  scale: 2
      t.decimal :vat,   precision: 6,  scale: 2
      t.decimal :net,   precision: 10, scale: 2
      t.integer :days
      t.decimal :profit
      t.decimal :percent,   precision: 9, scale: 5
      t.decimal :yearly,   precision: 9, scale: 5
      t.integer :sequence
      t.string :chart

      t.timestamps
    end
    add_index :cover_buys, :short_sell_id
  end
end
