class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :rentals

  attr_accessible :name, :user_id, :location, :title, :description, :bicycle_type, :price

  def rent(params = {})
    renter = params[:renter]
    user = params[:user] || User.find_by(id: renter.id)
    user_id = user.nil? ? nil : user.id

    # if a renter already has a valid card, then, use that to charge
    # otherwise, the card_href should be used as the source

    card = renter.vgs_payment_card
    if card.nil?
      card = PaymentCard.find_by(params[:card_id])
    end

=begin
    # create an Order
    order = self.user.vgs_customer.create_order(
      description: self.description
    )

    # debit the buyer for the amount of the listing
    order.debit_from(
      source: card,
      amount: self.price,
      description: self.description,
      appears_on_statement_as: 'BikeRental Rental'
    )

    # credit the owner of bicycle for the amount of listing
    # 
    # since this is an example, we're showing how to issue a credit
    # immediately. normally you should wait for order fulfillment
    # before crediting.

    order.credit_to(
      destination: self.user.vgs_bank_account,
      amount: self.price,
      description: self.description,
      appears_on_statement_as: 'RMyBike Payout'
    )
=end

    rental = Rental.new(
      listing_id: self.id,
      buyer_id: user_id,
      owner_id: self.user.id,
      order_href: 'n/a'
    )
    rental.save
  end
end
