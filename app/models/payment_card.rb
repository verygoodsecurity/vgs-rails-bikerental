class PaymentCard < ActiveRecord::Base
    belongs_to :user
    attr_accessible :card_number
end
