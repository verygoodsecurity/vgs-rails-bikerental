class RentalsController < ApplicationController

  def index
    render :confirmation
  end  

  def create
    # user represents a user in our database who wants to rent a bicycle
    # buyer is a another User object that knows about payment information for user
    # or guest who wants to rent a bicycle

    buyer, user = nil, nil

    # logic to handle guest/not signed in users

    if user_signed_in?
      buyer = current_user.vgs_customer
    # else
    #   buyer = User.create_vgs_customer(
    #     :name  => params[:"guest-name"],
    #     :email => params[:"guest-email_address"]
    #   )
    end

    @card = PaymentCard.create(
      card_number: params[:"guest-number"],
      expiration_year: params[:"guest-expiration_year"],
      expiration_month: params[:"guest-expiration_month"],
      security_code: params[:"guest-cvv"]
    )

    respond_to do |format|
      if @card.save
        format.html { render :confirmation}
        format.js
        format.json { render json: @card, status: :created }
      else
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end

    listing = Listing.find(params[:listing_id])
    listing.rent(renter: buyer, card_id: @card.id)
  end


end
