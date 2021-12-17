class CreateFoodCompounds < ActiveRecord::Migration[5.2]
  def change
    create_table :food_compounds do |t|
      t.integer :food_id, null: false
      t.integer :compound_id, null: false

      t.timestamps
    end
  end
end
