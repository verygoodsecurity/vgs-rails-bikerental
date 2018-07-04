class PaymentCard < ActiveRecord::Base
    belongs_to :user
    attr_accessible :card_number, :expiration_year, :expiration_month, :created_at, :updated_at, :user_id, :security_code
end
