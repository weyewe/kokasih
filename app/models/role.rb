class Role < ActiveRecord::Base
  has_many :assignments
  has_many :users, :through => :assignments
  
  def self.get_standard_employee_roles
    Role.where{ name.not_in NON_STANDARD_ROLE}
  end
  
  def self.get_roles_not_in( exception_role )
    Role.where{ name.not_in exception_role}
  end
  
  
end
