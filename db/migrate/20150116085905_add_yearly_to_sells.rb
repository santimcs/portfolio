class AddYearlyToSells < ActiveRecord::Migration
  def change
    add_column :sells, :yearly, :decimal, precision: 9, scale: 5
  end
end
