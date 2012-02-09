class AddTotalLoanRemainingToClient < ActiveRecord::Migration
  def change
    add_column :clients, :remaining_loan_amount, :decimal, :precision => 15, :scale => 2, :default => 0
  end
end
