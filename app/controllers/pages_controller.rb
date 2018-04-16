class PagesController < ApplicationController
  def home
    @rooms = Room.where(active: true).limit(3)
  end
end
