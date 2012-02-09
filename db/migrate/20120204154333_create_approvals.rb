class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.string :approvable_type, :null => false 
      t.string  :approvable_id, :default => 0
      
      t.integer :user_id
      

      t.timestamps
    end
  end
end
