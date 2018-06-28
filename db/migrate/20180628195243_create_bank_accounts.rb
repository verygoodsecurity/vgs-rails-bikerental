class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.string :account_number
      t.string :routing_number
      t.string :name
      t.string :account_type

      t.timestamps null: false
    end
  end
end
