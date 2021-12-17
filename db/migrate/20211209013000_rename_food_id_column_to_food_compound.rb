class RenameFoodIdColumnToFoodCompound < ActiveRecord::Migration[5.2]
  def change
    rename_column :food_compounds, :food_id, :food_name_id
  end
end
