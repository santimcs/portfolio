class AddChartToBuys < ActiveRecord::Migration
  def change
    add_column :buys, :chart, :string
  end
end
