class AddAccountCreatorToClient < ActiveRecord::Migration
  def change
    add_column :clients, :account_creator_id, :integer, :null => false
  end
end
