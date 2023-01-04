class Hotel < ApplicationRecord
  validates :name, :types, :rate, :location, presence: true
  validates_inclusion_of :rate, :in => [1, 2, 3, 4, 5]  # 酒店星级只能为1-5

  has_many :room_types, dependent: :delete_all

  # has_many :tourist_routes, through: :hotel_tourist_route_tables
  # has_many :hotel_tourist_route_tables, dependent: :destroy

  has_and_belongs_to_many :tourist_routes #, join_table: 'hotels_tourist_routes'
end
