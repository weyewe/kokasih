class LoansController < ApplicationController
  
  def index
    @client = Client.find_by_id( params[:client_id] )
    @loans = @client.loans
  end
  
  
  def new
    @client = Client.find_by_id( params[:client_id])
  end
  
  def search_client
  end
  
  def create
    @loan = Loan.new( params[:loan] )
    @loan.client_id = params[:client_id].to_i
    @loan.user_id = current_user.id 
    
    if @loan.save 
      flash[:notice] = "Loan creation is succesful"
    end
    
    redirect_to new_client_loan_url(@loan.client , :username => @loan.client.username )
  end
  
  def all_loans
    @loans = Loan.all
  end
  
end
