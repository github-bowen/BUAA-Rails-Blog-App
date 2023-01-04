class AirRoute < ApplicationRecord
  validates :from, :to, :departure_time, :landing_time, presence: true
  belongs_to :airline_company
  # belongs_to :tourist_route

  has_and_belongs_to_many :tourist_routes

  def is_direct_to_s
    self.is_direct ? '是' : '否'
  end

  def to_name
    self.from + ' → ' + self.to
  end

  def show
    directed = self.is_direct ? '直飞' : '中转'
    self.from + ' → ' + self.to + '（'  + self.airline_company.name + '，' + directed + '）'
  end
end
