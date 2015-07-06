class AddTypeToBuys < ActiveRecord::Migration
  def change
    add_column :buys, :type, :string  	
  end
end
