class CalendarsController < ApplicationController
    before_action :authenticate_user!
    
    def host
        @rooms = current_user.rooms 
        
        params[:start_date] ||= Date.current.to_s
        params[:room_id] ||= @rooms[0] ? @rooms[0].id : nil
        
        if params[:room_id]
            @room = Room.find(params[:room_id])
            start_date = Date.parse(params[:start_date])
            
            first_of_month = (start_date - 1.months).beginning_of_month
            end_of_month = (start_date + 1.months).end_of_month
            
            @events = @room.reservaions.join(:user)
                            .select('reservaions.*, users.fullname, users.image, users.email, users.uid')
                            .where('(start_date BETWEEN ? AND ?) AND status <> ?', first_of_month, end_of_month, 2)
        else
            @room = nil
            @event = []
        end
    end
end