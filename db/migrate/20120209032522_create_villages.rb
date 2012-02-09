class CreateVillages < ActiveRecord::Migration
  def change
    create_table :villages do |t|
      t.string :name
      t.integer :subdistrict_id

      t.timestamps
    end
  end
end
