class TouristRoute < ApplicationRecord
  validates :origin, :destination, :name, :total_days, :cost, :agency, presence: true
  # has_many :air_routes, dependent: :delete_all

  belongs_to :blog, optional: true
  belongs_to :user, optional: false

  # before_destroy :check_if_linked_with_blog, prepend: true

  # t.integer "hotels_id", default: [], array: true

  # has_many :hotels, through: :hotel_tourist_route_tables
  # has_many :hotel_tourist_route_tables, dependent: :nullify

  has_and_belongs_to_many :hotels, dependent: :nullify
  has_and_belongs_to_many :air_routes, dependent: :nullify

  def origin_dest
    self.origin + ' → ' + self.destination
  end

  private

  def check_if_linked_with_blog
    unless Blog.find_by(tourist_route_id: self.id).nil?
      blog = Blog.find_by_tourist_route_id(self.id)
      flash[:error] = ["该旅游路线与博客" + blog.title + "绑定，请先删除该博客后再删除！"]
      false
    end
    true
  end
end
