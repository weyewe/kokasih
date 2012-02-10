class ClientsController < ApplicationController
  def new
    @client  = Client.new
  end
  
  
  
  
  def create
    @new_client = Client.new(params[:client])
    
    # assign random_password to password and password_confirmation
    new_password = UUIDTools::UUID.timestamp_create.to_s[0..7]
    @new_client.password = new_password
    @new_client.password_confirmation = new_password
    @new_client.account_creator_id = current_user.id
    
    if @new_client.save 
      flash[:notice] = "Yeah, saved successfully"
    else
      flash[:error] = "New Client can't be saved. the account no & email is not unique"
    end
    
    redirect_to new_client_url( :username => params[:client][:username])
  end
  
  
  
  def execute_search
    @search_term = params[:search].downcase
    @client = Client.find_by_username( @search_term )
    @destination = params[:destination].to_i
    
    if @client.nil?
      flash[:error] = "Danger"
      redirect_to search_client_url 
      return
    else
      redirect_to  get_successful_search_client_destination( @client , @destination )
    end
  end
  
  def all_clients
  end
  
  protected
  
  def get_successful_search_client_destination( client, destination )
    
    if(  destination == ROLE_SYMBOL[:loan_creator]  )
      return new_client_loan_url(client)
    end
    
    if(  destination == ROLE_SYMBOL[:debt_collector]  )
      return client_loans_url(client)
    end
  end
  
end
