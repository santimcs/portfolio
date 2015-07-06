class AddNetToBuys < ActiveRecord::Migration
  def change
    add_column :buys, :net, :decimal, precision: 10, scale: 2
  end
end
