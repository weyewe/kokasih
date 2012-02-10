

# Create the CENTRAL OFFICE
central_office = Office.create :name => "CENTRAL"

super_user_role     = Role.create :name => "SuperUser"
# what can super_user do?
# 1. create office
# 2. create employee for that office (Manager)
# 

manager_role          = Role.create :name => "Manager"  #previously, called admin
cashier_role        = Role.create :name => "Cashier"
loan_creator_role   = Role.create :name => "LoanCreator"
debt_collector_role = Role.create :name => "DebtCollector"
master_data_role    = Role.create :name => "MasterData"

# Create super user  role
super_user = User.create :email => "super_user@gmail.com", :username=>"super_user",
                :password => "willy1234", :password_confirmation => "willy1234",
                :office_id => central_office.id
                
super_user.roles << super_user_role
super_user.roles << manager_role
super_user.save



# base case, starts in Cilincing 
dki_jakarta = Province.create :name => "DKI Jakarta"
jakarta_utara = Regency.create :name => "Jakarta Utara", :province_id => dki_jakarta.id 
cilincing = Subdistrict.create :name => "Cilincing", :regency_id => jakarta_utara.id 


# Create the First Office, Cilincing
Office.create :name => "Cilincing", :province_id => dki_jakarta.id, 
          :regency_id => jakarta_utara.id,
          :subdistrict_id => cilincing.id





# when a new company is created, it is logged with role SuperUser, granted with Admin rights