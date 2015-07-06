class AddChartToSells < ActiveRecord::Migration
  def change
    add_column :sells, :chart, :string
  end
end
