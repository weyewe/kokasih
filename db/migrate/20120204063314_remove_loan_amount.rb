class RemoveLoanAmount < ActiveRecord::Migration
  def up
    remove_column :clients, :remaining_loan_amount
  end

  def down
    add_column :clients, :remaining_loan_amount, :decimal, :precision => 15, :scale => 2, :default => 0
  end
end
