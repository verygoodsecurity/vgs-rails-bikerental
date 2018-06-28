class CreatePaymentCards < ActiveRecord::Migration
  def change
    create_table :payment_cards do |t|
      t.string :card_number, limit: 19
      t.integer :expiration_year
      t.integer :expiration_month
      t.integer :security_code

      t.timestamps null: false
    end
  end
end
