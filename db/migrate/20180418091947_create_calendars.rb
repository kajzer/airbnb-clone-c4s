class CreateCalendars < ActiveRecord::Migration[5.0]
  def change
    create_table :calendars do |t|
      t.date :day
      t.integer :price
      t.integer :status
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
