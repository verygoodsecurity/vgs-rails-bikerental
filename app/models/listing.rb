class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :rentals

  attr_accessible :name, :user_id, :location, :title, :description, :bicycle_type, :price

  def rent(params = {})
    renter = params[:renter]
    user = params[:user] || User.find_by(id: renter.id)
    user_id = user.nil? ? nil : user.id

    
    card = renter.vgs_payment_card
    if card.nil?
      card = PaymentCard.find_by(params[:card_id])
    end

    rental = Rental.new(
      listing_id: self.id,
      buyer_id: user_id,
      owner_id: self.user.id,
      order_href: 'n/a'
    )
    rental.save
  end
end
