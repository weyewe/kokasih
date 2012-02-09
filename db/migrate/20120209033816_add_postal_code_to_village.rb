class AddPostalCodeToVillage < ActiveRecord::Migration
  def change
    add_column :villages, :postal_code, :integer, :default => nil
  end
end
