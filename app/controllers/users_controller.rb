# Users controller is made to handle User account created by the admin/super admin

class UsersController < ApplicationController

  def create_employee
    
    create_basic_user(params)
    # @new_user = User.new(params[:user])
    #  # assign random_password to password and password_confirmation
    #  new_password = UUIDTools::UUID.timestamp_create.to_s[0..7]
    #  @new_user.password = new_password
    #  @new_user.password_confirmation = new_password
    
    # assume that only manager that can create a new user 
    @new_user.office_id = current_user.office_id 
    
    if @new_user.valid? 
      User.create_and_assign_roles( @new_user, params[:role][:role_id])
    end
    
    redirect_to root_url
  end
  
  
  def new_employee
  end
  
  def all_employees
    # @employees = User.all_user_except_role( Role.find_by_name("SuperUser") )
    @employees = User.current_office_employee( current_user.office )
    @roles = Role.get_roles_not_in( NON_STANDARD_ROLE  - MANAGER_ROLE  )
  end
  
  def edit_employee
    @employee = User.find_by_username(params[:username])
  end
  
  def update_employee
    @employee = User.find_by_username(params[:username])
    # User.updaet_roles(@employee , params[:role][:role_id])
    if not params[:role].nil?
      @employee.update_roles( params[:role][:role_id].map{|x| x.to_i})
    else
      @employee.update_roles(  [] )
    end
    
    # parse the role, update
    redirect_to edit_employee_url(@employee.username)
  end
  
  
  def new_branch_manager
  end
  
  def create_new_branch_manager
    create_basic_user(params)
    @new_user.office_id = params[:office_selection]
    manager_role = Role.find_by_name "Manager"
    @new_user.roles << manager_role 
    @new_user.save
    
    
    redirect_to new_branch_manager_url
  end
  
  
  protected
  def create_basic_user(params)
    @new_user = User.new(params[:user])
    # assign random_password to password and password_confirmation
    @new_user.username = ( User.count + 1  ).to_s
    new_password = UUIDTools::UUID.timestamp_create.to_s[0..7]
    @new_user.password = new_password
    @new_user.password_confirmation = new_password
  end
end
