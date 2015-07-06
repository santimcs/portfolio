class DropTypeFromBuys < ActiveRecord::Migration
  def up
  	remove_column :buys, :type
  end

  def down
  end
end
