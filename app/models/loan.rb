class Loan < ActiveRecord::Base
  has_many :payments

  def balance
    funded_amount - payments.pluck(:amount).sum
  end 
end
