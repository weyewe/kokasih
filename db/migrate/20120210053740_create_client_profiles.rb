class CreateClientProfiles < ActiveRecord::Migration
  def change
    create_table :client_profiles do |t|
      t.integer :client_id , :null => false 
      t.string :name 
      t.integer :province_id
      t.integer :regency_id
      t.integer :subdistrict_id
      t.integer :village_id
      t.integer :commune_id
      t.integer :neighborhood
      
      t.text :address

      t.timestamps
    end
  end
end
