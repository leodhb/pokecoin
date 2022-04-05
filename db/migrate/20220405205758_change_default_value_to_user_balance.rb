class ChangeDefaultValueToUserBalance < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :balance, 0
  end
end
