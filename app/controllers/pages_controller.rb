class PagesController < ApplicationController
  def home
    @rooms = Room.where(active: true).limit(3)
  end
  
  def search
    # Did the user provided location
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    end
    
    # If we have value for location we get nearby rooms
    if session[:loc_search] && session[:loc_search] != ""
      @rooms_address = Room.where(active: true).near(session[:loc_search], 5, order: 'distance')
    else
      @rooms_adress = Room.where(active: true).all
    end
    
    # Use ransack to apply all the filters that user selected to rooms found
    @search = @rooms_address.ransack(params[:q])
    @rooms = @search.result
    
    @arrRooms = @rooms.to_a
    
    
    # If user search date range and we check if the room is avaliable
    if (params[:start_date] && params[:end_date] && !params[:start_date].empty? && !params[:end_date].empty?)
    
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      
      @rooms.each do |room|
        not_available = room.reservations.where(
          "(? <= start_date AND start_date <= ?)
          OR (? <= end_date AND end_date <= ?)
          OR (start_date < ? AND ? < end_date)",
          start_date, end_date,
          start_date, end_date,
          start_date, end_date
        ).limit(1)
        
        if not_available.length > 0 
          @arrRooms.delete(room)
        end
      end
    end
  end
  
end
