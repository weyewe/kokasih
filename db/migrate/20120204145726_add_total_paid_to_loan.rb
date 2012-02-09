class AddTotalPaidToLoan < ActiveRecord::Migration
  def change
    add_column :loans, :total_paid, :decimal, :precision => 15, :scale => 2, :default => 0
  end
end
