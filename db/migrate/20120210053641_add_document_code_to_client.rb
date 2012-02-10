class AddDocumentCodeToClient < ActiveRecord::Migration
  def change
    add_column :clients, :document_code, :string 
  end
end
