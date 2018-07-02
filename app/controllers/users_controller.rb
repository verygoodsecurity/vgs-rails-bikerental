class UsersController < ApplicationController
    before_filter :authenticate_user!, :only => [:new, :create, :edit, :update]

    def show
      user_id = User.find(params[:id])
      @card = PaymentCard.find_by_user_id(user_id)
      print(@card)
    end
  
end


  