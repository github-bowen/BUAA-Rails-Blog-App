class AddHotelToRoomTypes < ActiveRecord::Migration[7.0]
  def change
    add_reference :room_types, :hotel, null: true, foreign_key: true
  end
end
