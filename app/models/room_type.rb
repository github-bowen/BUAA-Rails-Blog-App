class RoomType < ApplicationRecord
  validates :name, :price, presence: true
  belongs_to :hotel

  # validates_inclusion_of :has_window, :in => [true, false]

  def has_or_not
    self.has_window == true ? "有" : "无"
  end
end
