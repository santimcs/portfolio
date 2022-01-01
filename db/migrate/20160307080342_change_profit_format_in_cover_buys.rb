class ChangeProfitFormatInCoverBuys < ActiveRecord::Migration
  def up
  	change_column :cover_buys, :percent, :decimal, precision: 9, scale: 5
  end

  def down
  	change_column :cover_buys, :percent, :decimal
  end
end
