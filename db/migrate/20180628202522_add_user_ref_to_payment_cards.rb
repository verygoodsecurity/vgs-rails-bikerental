class AddUserRefToPaymentCards < ActiveRecord::Migration
  def change
    add_reference :payment_cards, :user, index: true, foreign_key: true
  end
end
