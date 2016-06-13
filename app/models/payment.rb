class Payment < ActiveRecord::Base
  belongs_to :loans
end
