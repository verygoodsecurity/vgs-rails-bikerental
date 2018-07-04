class RentalsController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:create]

  def index
    render :confirmation
  end

  def create
    renter = User.find_by_email(params[:'guest-email_address'])

    card = PaymentCard.create(
        card_number: params[:'guest-number'],
        expiration_year: params[:'guest-expiration_year'],
        expiration_month: params[:'guest-expiration_month'],
        security_code: params[:'guest-cvv'],
        user_id: renter.id
    )

    listing = Listing.find(params[:listing_id])
    listing.rent(renter: renter, card_id: card.id)

    render nothing: true
  end


end
