class ChangeColumnsAddNotnullonFoods < ActiveRecord::Migration[5.2]
  def change
    change_column_null :foods, :user_id, true
  end
end
