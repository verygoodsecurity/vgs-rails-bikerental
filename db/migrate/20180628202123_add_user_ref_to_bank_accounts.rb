class AddUserRefToBankAccounts < ActiveRecord::Migration
  def change
    add_reference :bank_accounts, :user, index: true, foreign_key: true
  end
end
