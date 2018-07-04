class RentalsController < ApplicationController

  def index
    render :confirmation
  end

  def create
    card = PaymentCard.create(
        card_number: params[:'guest-number'],
        expiration_year: params[:'guest-expiration_year'],
        expiration_month: params[:'guest-expiration_month'],
        security_code: params[:'guest-cvv']
    )

    listing = Listing.find(params[:listing_id])
    listing.rent(renter: current_user, card_id: card.id)

    render nothing: true
  end


end
