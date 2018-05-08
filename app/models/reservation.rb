class Reservation < ApplicationRecord
  enum status: {Waiting: 0, Approved: 1, Declined: 2}
  
  belongs_to :user
  belongs_to :room
  
  # Same as scope
  # def approved_reservations
  #   self.where(status: 1)
  # end
  
  #scope :approved_reservations, -> (status) { where("status = ?", status) }
  
  scope :current_week_revenue, -> (user) {
    joins(:room)
    .where("rooms.user_id = ? AND reservations.updated_at >= ? AND reservations.status = ?", user.id, 1.week.ago, 1)
    .order(updated_at: :asc)
  }
  
  scope :current_month_revenue, -> (user) {
    joins(:room)
    .where("rooms.user_id = ? AND reservations.updated_at >= ? AND reservations.status = ?", user.id, 1.month.ago, 1)
    .order(updated_at: :asc)
  }
  
end
