class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :rentals

  attr_accessible :name, :user_id, :location, :title, :description, :bicycle_type, :price, :renter

  def rent(params = {})
    renter = params[:renter]

    card = renter.vgs_payment_card
    card = PaymentCard.find_by(params[:card_id]) if card.nil?

    rental = Rental.new(
      listing_id: self.id,
      buyer_id: renter.id,
      owner_id: self.user.id,
      order_href: 'n/a'
    )
    rental.save    
  end
end
