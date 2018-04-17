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
    
    def update_phone_number
      current_user.update_attributes(user_params)
      current_user.generate_pin
      current_user.send_pin
      
      redirect_to edit_user_registration_path, notice: "Saved..."
      
    rescue Exception => e
      redirect_to edit_user_registration_path, alert: "#{e.message}"
    end
    
    def verify_phone_number
      current_user.verify_pin(params[:user][:pin])
      
      if current_user.phone_verified
        flash[:notice] = "Your phone number is verified."
      else
        flash[:alert] = "Cannot verify your phone number."
      end
      
      redirect_to edit_user_registration_path
      
    rescue Exception => e
      redirect_to edit_user_registration_path, alert: "#{e.message}"
    end
    
    private
      
      def user_params
        params.require(:user).permit(:phone_number, :pin)
      end
    
end