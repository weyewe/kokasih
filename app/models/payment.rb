class Payment < ActiveRecord::Base
  after_create :add_transaction_code, :add_total_paid_loan
  # before_destroy :reduce_total_paid_loan
  belongs_to :user
  belongs_to :loan
  
  def can_be_saved?
    
    if self.amount < 0 
      return false
    end
    
    loan = self.loan
    
    (loan.remaining_payment - self.amount) >= 0 
 
  end
  
  
  def add_transaction_code
    # USER_ID  + Loan_id
    decimal_code = self.user.id.to_s + self.loan.id.to_s + self.id.to_s
    self.transaction_code = ("PAY-" + dec2hex( decimal_code ) ).downcase
    self.save
  end
  
  
  
  protected
  
  def add_total_paid_loan
    self.loan.add_total_paid( self.amount )
  end
  

  

  
  def dec2hex(number)
     number = Integer(number);
     hex_digit = "0123456789ABCDEF".split(//);
     ret_hex = '';
     while(number != 0)
        ret_hex = String(hex_digit[number % 16 ] ) + ret_hex;
        number = number / 16;
     end
     return ret_hex; ## Returning HEX
  end
  
  
end
