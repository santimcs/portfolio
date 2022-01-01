class ChangeYearlyInSells < ActiveRecord::Migration[5.0]
  def up
  	change_column :sells, :yearly, :decimal, precision: 11, scale: 5
  end

  def down
  	change_column :sells, :yearly, :decimal, precision: 9, scale: 5
  end
end
