class CreateLoanClearances < ActiveRecord::Migration
  def change
    create_table :loan_clearances do |t|
      t.integer :loan_id
      t.boolean :is_cleared, :default => false
      #  it is linked to the Approval table 

      t.timestamps
    end
  end
end
