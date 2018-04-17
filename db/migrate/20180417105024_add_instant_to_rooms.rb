class AddInstantToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :instant, :integer, default: 1
  end
end
