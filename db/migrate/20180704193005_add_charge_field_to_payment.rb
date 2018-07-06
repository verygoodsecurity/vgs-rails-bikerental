class AddChargeFieldToPayment < ActiveRecord::Migration
  def change
    add_column :payment_cards, :charge_id, :string
  end
end
