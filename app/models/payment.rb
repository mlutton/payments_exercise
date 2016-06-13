class Payment < ActiveRecord::Base
  belongs_to :loan

  validates :amount, presence: true
  validates :date, presence: true
  validates :loan, presence: true
  
  validate :payments_cant_be_greater_than_loan_balance
 
  private

  def payments_cant_be_greater_than_loan_balance
    return unless amount && loan
    return unless amount > loan.balance

    errors.add(:amount, "can't be greater than loan balance")
  end
end
