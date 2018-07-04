class UsersController < ApplicationController

    def show
        @card = PaymentCard.find_by_user_id(params[:id])
    end
  
end


  