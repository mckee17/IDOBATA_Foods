class AddCompoundIdToFood < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :compound_id, :integer
    change_column_null :foods, :compound_id, false
  end
end
