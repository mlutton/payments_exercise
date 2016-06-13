class Payment < ActiveRecord::Base
  belongs_to :loan

  validates :amount, presence: true
  validates :date, presence: true
end
