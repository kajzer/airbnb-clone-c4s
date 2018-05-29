class Api::V1::ReservationsController < Api::V1::BaseController
    before_action :authenticate_with_token!
    before_action :set_reservation, only: [:approve, :decline]
    
    def create
        room = Room.find(params[:room_id])
        
        if current_user.stripe_id.blank?
            render json: { error: "Update your payment method", is_success: false }, status: 404
        elsif current_user == room.user
            render json: { error: "you can't book your own property", is_success: false }, status: 404
        else
            # Calculate the total amount of that reservation
            start_date = DateTime.parse(reservation_params[:start_date])
            end_date = DateTime.parse(reservation_params[:end_date])
            
            days = (end_date - start_date).to_i + 1
            special_days = Calendar.where(
                "room_id = ? AND status = ? AND day BETWEEN ? AND ? AND price <> ?",
                room.id, 0, start_date, end_date, room.price
            ).pluck(:price)
            
            # Make a reservation
            reservation = current_user.reservations.build(reservation_params)
            reservation.room = room
            reservation.price = room.price
            reservation.total = room.price * (days - special_days.count)
            
            special_days.each do |d|
                reservation.total += d.price     
            end
            
            if reservation.Waiting! && room.Instant?
               charge(room, reservation) 
            end
            
            render json: { is_success: true }, status: :ok
            
        end
    end
    
    def reservations_by_room
        reservations = Reservation.where(room_id: params[:id])
        reservations = reservations.map { |r| ReservationSerializer.new(r, avatar_url: r.user.image) }
        render json: {reservations: reservations, is_success: true}, status: :ok
    end
    
    def approve
        if @reservation.room.user_id == current_user.id #if current user is host of this room
            charge(@reservation.room, @reservation)
            render json: {is_success: true}, status: :ok
        else
            render json: {error: "No Permission", is_success: false}, status: 404
        end
        
    end
    
    def decline
        if @reservation.room.user_id == current_user.id #if current user is host of this room
            @reservation.Declined!
            render json: {is_success: true}, status: :ok
        else
            render json: {error: "No Permission", is_success: false}, status: 404
        end
    end
    
    
    
    private
    
        def set_reservation
            @reservation = Reservation.find(params[:id])
        end
        
        def reservation_params
            params.require(:reservation).permit(:start_date, :end_date)
        end
        
        def charge(room, reservation)
            if reservation.user.stripe_id.blank? && room.user.merchant_id.blank?
                customer = Stripe::Customer.retrieve(reservation.user.stripe_id)
                charge = Stripe::Charge.create(
                    :customer => customer.id,
                    :amount => reservation.total * 100,
                    :description => room.listing_name,
                    :currency => 'usd',
                    :destination => {
                        :amount => reservation.total * 80,
                        :account => room.user.merchant_id
                    }
                )
                
                if charge
                    reservation.Approved!
                else
                    reservation.Declined!
                end
            end
        rescue Stripe::CardError => e
            reservation.declined!
            render json: {error: e.message, is_success: false}, status: 404
        end
end