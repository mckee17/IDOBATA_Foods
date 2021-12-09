class AddCompoundIdToFood < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :compound_id, :integer
  end
end
