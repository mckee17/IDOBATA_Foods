class CreateFoodNames < ActiveRecord::Migration[5.2]
  def change
    create_table :food_names do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
