class UsersController < ApplicationController
    before_filter :authenticate_user!, :only => [:new, :create, :edit, :update]

    def show
      user = User.find(params[:"id"])

      @cards = user.payment_cards
    end
  
end
  