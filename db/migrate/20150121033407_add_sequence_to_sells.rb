class AddSequenceToSells < ActiveRecord::Migration
  def change
    add_column :sells, :sequence, :integer
  end
end
