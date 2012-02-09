# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

super_user_role     = Role.create :name => "SuperUser"
admin_role          = Role.create :name => "Admin"
cashier_role        = Role.create :name => "Cashier"
loan_creator_role   = Role.create :name => "LoanCreator"
debt_collector_role = Role.create :name => "DebtCollector"
master_data_role    = Role.create :name => "MasterData"


# base case, starts in Cilincing 
dki_jakarta = Province.create :name => "DKI Jakarta"
jakarta_utara = Regency.create :name => "Jakarta Utara", :province_id => dki_jakarta.id 
cilincing = Subdistrict.create :name => "Cilincing", :regency_id => jakarta_utara.id 




# when a new company is created, it is logged with role SuperUser, granted with Admin rights