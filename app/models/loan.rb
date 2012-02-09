class Loan < ActiveRecord::Base
  belongs_to :client
  belongs_to :user
  
  has_many :payments
  
  after_create :add_loan_clearance
  has_one :loan_clearance
  
  def remaining_payment
    amount - total_paid
  end
  
  def add_total_paid( payment_amount )
    self.total_paid += payment_amount
    self.save
    
    check_loan_fulfillment
  end
  
  protected
  
  def check_loan_fulfillment
    if ( self.amount - self.total_paid )  == 0 
      self.loan_clearance.is_cleared = true
      self.loan_clearance.save 
    end
  end
  
  def add_loan_clearance
    LoanClearance.create :loan_id => self.id
  end
  
end
