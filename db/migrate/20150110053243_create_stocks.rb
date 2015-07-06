class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
  t.string :name
  t.integer :category_id
  t.string :website

    end
  end
end
