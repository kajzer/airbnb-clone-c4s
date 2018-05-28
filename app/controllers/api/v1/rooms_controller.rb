class Api::V1::RoomsController < Api::V1::BaseController
    def index
        if !params[:address].blank?
            rooms = Room.where(active: true).near(params[:address], 5, order: 'distance')
        else
            rooms = Room.where(active: true)
        end
        
        if !params[:start_date].blank? && !params[:end_date].blank?
            start_date = DateTime.parse(parmas[:start_date])
            end_date = DateTime.parse(parmas[:end_date])
            
            rooms = rooms.select { |room| 
                # Check 1: if there are any approved reservations overlap this date range
                reservations = Reservtion.where(
                    "room_id = ? AND (start_date <= ? AND end_date >= ?) AND status = ?",
                    room.id, end_date,start_date, 1
                ).count
                
                # Check 2: if there are any unavaliable dates within that date range
                calendars = Calendar.where(
                    "room_id = ? AND status = ? AND day BETWEEN ? AND ?",
                    room.id, 1, start_date, end_date
                ).count
                
                reservations == 0 && calendars == 0
            }
        end
        
        render json: {
            rooms: rooms.map { |room| room.attributes.merge(image: room.cover_photo('medium'), instant: room.instant != "Request") },
            is_success: true
        }, status: :ok
        
    end
    
    def show
        room = Room.find(params[:id])
        today = Date.today
        reservations = Reservation.where(
            "room_id = ? AND (start_date >= ? AND end_date >= ?) AND status = ?",
            params[:id], today, today, 1
        )
        
        unavailable_dates = reservations.map { |r| 
            (r[:start_date].to_datetime...r[:end_date].to_datetime).map { |day| day.strftime("%Y-%m-%d") }
        }.flatten.to_set
        
        calendars = Calendar.where(
         "room_id = ? AND status = ? AND day >= ?",
         params[:id], 1, today
        ).pluck(:day).map(&:to_datetime).map { |day| day.strftime("%Y-%m-%d") }.flatten.to_set
        
        unavailable_dates.merge calendars
        
        if !room.nil?
            room_serializer = RoomSerializer.new(
                room,
                image: room.cover_photo('medium'),
                #avatar_url: room.user.image,
                unavailable_dates: unavailable_dates
            )
            render json: {room: room_serializer, is_success: true }, status: :ok
        else
            render json: { error: "Invalid ID", is_success: false }, status: 422
        end
        
    end
    
    def your_listings
        rooms = current_user.rooms
        render json: {
            rooms: rooms.map { |r| r.attributes.merge(image: r.cover_photo('medium'), instant: r.instant != "Request" ) },
            is_success: true
        }, status: :ok
    end
    
end