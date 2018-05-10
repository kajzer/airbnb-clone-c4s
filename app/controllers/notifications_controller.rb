class NotificationsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        current_user.unread = 0
        current_user.save
        
        @notifications = current_user.notifications.reverse
    end
end