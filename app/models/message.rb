class Message < ApplicationRecord
  include ActionView::Helpers::DateHelper
  belongs_to :user
  belongs_to :conversation
  
  validates_presence_of :context, :conversation_id, :user_id
  
  def message_time
    #self.created_at.strftime("%v")
    time_ago_in_words(self.created_at)
  end
  
end
