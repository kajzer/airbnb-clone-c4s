class RevenuesController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @reservations = Reservation.current_week_revenue(current_user)
        
        @this_week_revenue = @reservations.map {|r| {r.updated_at.strftime("%Y-%m-%d") => r.total} }
                                            .inject({}) {|a,b| a.merge(b){|_,x,y| x + y}}
    
    end
end