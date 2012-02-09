class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :client_id
      t.integer :user_id

      t.decimal :amount, :precision => 15, :scale => 2
      t.text :description 

      
      t.timestamps
    end
  end
end
