class RentalsController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:create]

  def index
    render :confirmation
  end

  def create
    renter = User.find_by_email(params[:'guest-email_address'])

    card = PaymentCard.new(
        card_number: params[:'guest-number'],
        expiration_year: params[:'guest-expiration_year'],
        expiration_month: params[:'guest-expiration_month'],
        security_code: params[:'guest-cvv'],
        user_id: renter.id
    )
    listing = Listing.find(params[:listing_id])

    stripe = Stripe::Token.create(card: {
        number: card.card_number,
        exp_month: card.expiration_month,
        exp_year: card.expiration_year,
        cvc: card.security_code
    })
    charge = Stripe::Charge.create(amount: listing.price, currency: 'USD', source: stripe.id)

    card.update(charge_id: charge.id)
    listing.rent(renter: renter, card_id: card.id)

    render nothing: true
  end


end
