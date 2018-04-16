class PagesController < ApplicationController
  def home
    @rooms = Room.where(active: true).limit(3)
  end
  
  def search
        
  end
  
end
