class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
  t.string :name
  t.decimal :sequence

    end
  end
end
