class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification_#{params[:id]}"
  end


end
