class ListingsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update]
  before_filter :listing_owner_required, :only => [:edit, :update]

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def create
    owner_customer = current_user.vgs_customer

    # build bank account from fields
    bank_account = BankAccount.create(
      account_number: params[:account_number],
      routing_number: params[:routing_number],
      account_type: params[:account_type],
      name: params[:name],
      user: owner_customer
    )

    # add bank account href passed back from secureform

    @listing = current_user.listings.new(
      title: params[:listing_title],
      location: params[:listing_location],
      bicycle_type: params[:listing_bike_type],
      price: params[:listing_rent_price].to_i * 100
    )

    if @listing.save!
      render :confirmation
    else
      render :new
    end
  end

  def new
    @random_listing = Listing.find(rand(Listing.all.length)+1)
  end

  def edit
    @listing = current_user.listings.find(params[:id])
  end

  def update
    @listing = current_user.listings.find(params[:id])
    if @listing.update_attributes(params[:listing])
      @listing.price = @listing.price * 100
      @listing.save!
      flash[:notice] = "Listing updated successfully."
      redirect_to listing_path(@listing)
    else
      flash[:error] = "There was a problem updating the listing."
      render :action => :edit
    end
  end

private

  def listing_owner_required
    head :forbidden unless (@listing.present? && user_signed_in? && @listing.users.include?(current_user))
  end

end

