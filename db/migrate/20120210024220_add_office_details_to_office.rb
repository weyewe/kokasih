class AddOfficeDetailsToOffice < ActiveRecord::Migration
  def change
    add_column :offices, :island_id , :integer
    add_column :offices, :province_id , :integer
    add_column :offices, :regency_id , :integer
    add_column :offices, :subdistrict_id , :integer
  end
end
