class ChangeProfitDecimalInCoverBuys < ActiveRecord::Migration
  def up
  	change_column :cover_buys, :profit, :decimal, precision: 8, scale: 2
  end

  def down
  	change_column :cover_buys, :profit, :decimal
  end
end
