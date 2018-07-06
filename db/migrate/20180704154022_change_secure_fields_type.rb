class ChangeSecureFieldsType < ActiveRecord::Migration
  def change
    change_column :payment_cards, :security_code, :string
    change_column :payment_cards, :expiration_year, :string
    change_column :payment_cards, :expiration_month, :string
  end
end
