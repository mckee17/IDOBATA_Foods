class CangeColumnsUniquenessOnCompoundFoodNameUser < ActiveRecord::Migration[5.2]
  def change
    add_index :compounds, :name, unique: true
    add_index :food_names, :name, unique: true
    add_index :users, :name, unique: true
  end
end
