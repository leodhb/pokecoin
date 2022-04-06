class AddAmountToTransactionField < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :amount, :decimal, precision: 15, scale: 2
  end
end
