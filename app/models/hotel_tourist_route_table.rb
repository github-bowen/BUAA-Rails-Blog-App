class HotelTouristRouteTable < ApplicationRecord
  belongs_to :hotel
  belongs_to :tourist_route
end
