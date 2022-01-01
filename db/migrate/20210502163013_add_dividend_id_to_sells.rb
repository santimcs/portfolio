class AddDividendIdToSells < ActiveRecord::Migration[5.0]
  def change
    add_column :sells, :dividend_id, :integer, default: 0
  end
end
