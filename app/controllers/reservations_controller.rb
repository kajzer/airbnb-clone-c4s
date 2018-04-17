class ReservationsController < ApplicationController
    before_action :authenticate_user!
    
    def create
       room = Room.find(params[:room_id])
       
       if current_user == room.user
           flash[:alert] = "You can't book your own property"
       else
           start_date = Date.parse(reservation_params[:start_date])
           end_date = Date.parse(reservation_params[:end_date])
           days = (end_date - start_date).to_i + 1
           
           @reservation = current_user.reservations.build(reservation_params)
           @reservation.room = room
           @reservation.price = room.price
           @reservation.total = room.price * days
           #@reservation.save
           
           if @reservation.save
              if room.Request?
                flash[:notice] = "Request sent successfully!"    
              else
                @reservation.Approved!   # ~ @reservation.status = 1  @reservation.save
                flash[:notice] = "Reservation created successfully!"
              end
           else
               flash[:alert] = "Cannot make a reservation!"
           end
           
           
           #flash[:notice] = "Booked Successfully"           
       end
           
       redirect_to room
    end
    
    def your_trips
        @trips = current_user.reservations.order(start_date: :asc)
    end
    
    def your_reservations
        @rooms = current_user.rooms
    end
    
    private
    
        def reservation_params
            params.require(:reservation).permit(:start_date, :end_date)
        end
end