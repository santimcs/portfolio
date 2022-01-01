class CreateShortSells < ActiveRecord::Migration
  def change
    create_table :short_sells do |t|
      t.references :stock
      t.date :date
      t.integer :qty
      t.decimal :price, precision: 6,   scale: 2
      t.decimal :fee,   precision: 7,   scale: 2
      t.decimal :vat,   precision: 6,   scale: 2
      t.decimal :net,   precision: 10,  scale: 2
      t.string :kind
      t.string :chart
      t.string :status

      t.timestamps
    end
    add_index :short_sells, :stock_id
  end
end
