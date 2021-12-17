class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.integer :food_name_id, null: false
      t.integer :genre_id, null: false
      t.integer :user_id, null: false
      t.string :function, null: false
      t.text :comment
      t.float :rate, null: false
      t.string :profile_image_id

      t.timestamps
    end
  end
end
