class RentalsController < ApplicationController

  def index
    render :confirmation
  end

  def create
    # user represents a user in our database who wants to rent a bicycle
    # buyer is a another User object that knows about payment information for user
    # or guest who wants to rent a bicycle

    buyer, user = nil, nil

    respond_to do |format|
      if request.xhr?
        buyer = User.find_by_email(params[:"guest-email_address"])

        @card = PaymentCard.create(
          card_number: params[:"guest-number"],
          expiration_year: params[:"guest-expiration_year"],
          expiration_month: params[:"guest-expiration_month"],
          security_code: params[:"guest-cvv"]
        )

        listing.rent(renter: buyer, card_id: @card.id)
        listing = Listing.find(params[:listing_id])
        redirect_to rentals_url
      else
        format.html {render :confirmation}
      end
    end
    
  end


end
