class PaymentsController < ApplicationController
  include ActionView::Helpers::NumberHelper
  
  def search_client
  end
  
  def new_loan_payment
    @client = Client.find_by_id( params[:client_id])
    @loan = Loan.find_by_id( params[:loan_id] )
  end
  
  def create
    @payment = Payment.new( params[:payment] )
    @loan = Loan.find_by_id( params[:loan_id] )
    
    @payment.amount = params[:payment][:amount].to_f
    @payment.loan_id = @loan.id
    @payment.user_id = current_user.id
    
    # -> if the payment amount does't exceed the loan amount due
    if @payment.can_be_saved? 
      @payment.save
        flash[:notice] = "Yes, payment of <b>" + 
                "#{number_to_currency( @payment.amount, :unit => "Rp "  )}</b> is successful! "+ 
                "Transaction code = <b>#{@payment.transaction_code.upcase}</b>"
   
      
    else
      if @payment.amount > 0 
        flash[:error] = "Ah no! the amount entered is exceeds the remaining payment."  +
                    " It should't exceed " + 
                    "#{number_to_currency( @loan.remaining_payment, :unit => 'Rp '   )}"
      else
        flash[:error] = "The amount of payment can't be negative." +
                  " You entered <b>#{number_to_currency( @payment.amount, :unit => ''   )}</b> "
      end
    end
    
    # http://icfun.blogspot.com/2008/04/ruby-number-conversion-from-one-base-to.html
    #  convert from decimal to hex, or to binary, should it be needed
    # Transaction_code
    
    redirect_to new_loan_payment_url(@loan.client.id , @loan.id)
  end
  
  
end
