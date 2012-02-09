class AddFieldsToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :amount, :decimal, :precision => 15, :scale => 2
    add_column :payments, :loan_id, :integer, :null => false
    add_column :payments, :user_id, :integer, :null => false
  end
end
