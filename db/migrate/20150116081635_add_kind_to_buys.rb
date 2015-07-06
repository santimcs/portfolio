class AddKindToBuys < ActiveRecord::Migration
  def change
    add_column :buys, :kind, :string
  end
end
