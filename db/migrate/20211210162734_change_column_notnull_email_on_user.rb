class ChangeColumnNotnullEmailOnUser < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :email, true
    change_column_default :users, :email, nil
  end
end
