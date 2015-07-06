class ChangePercentFormatInSells < ActiveRecord::Migration
  def up
  	change_column :sells, :percent, :decimal, precision: 9, scale: 5
  end

  def down
  	change_column :sells, :percent, :decimal, precision: 5, scale: 5
  end
end
