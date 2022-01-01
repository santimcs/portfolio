class CreateDividends < ActiveRecord::Migration[5.0]
  def change
    create_table :dividends do |t|
      t.integer :stock_id
      t.string :name
      t.integer :year
      t.integer :quarter
      t.integer :number
      t.decimal :ppu, precision: 8, scale: 6
      t.decimal :amt, precision: 8, scale: 2
      t.decimal :net, precision: 8, scale: 2
      t.date :x_date
      t.date :p_date

    end
  end
end
