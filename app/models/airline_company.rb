class AirlineCompany < ApplicationRecord
  validates :name, presence: true
  has_many :air_routes, dependent: :delete_all
  # belongs_to :tourist_route
end
