class AddTransactionCodeToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :transaction_code, :text 
  end
end
