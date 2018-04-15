class UsersController < ApplicationController
    #before_action :authenticate_user!, only: [:show]
    
    def show
      @user = User.find(params[:id])
      #redirect_to root_path, notice: "You don't have permission to see this profile" unless current_user == @user
      @rooms = @user.rooms
      # Display all the guest reviews to host (if this user is a host)
      @guest_reviews = Review.where(type: "GuestReview", host_id: @user.id)
      
      # Display all the guest reviews to host (if this user is a guest)
      @host_reviews = Review.where(type: "HostReview", guest_id: @user.id)
    end
end