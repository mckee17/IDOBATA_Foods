class RenameProfileImageIdColumsToFood < ActiveRecord::Migration[5.2]
  def change
    rename_column :foods, :profile_image_id, :image_id
  end
end
