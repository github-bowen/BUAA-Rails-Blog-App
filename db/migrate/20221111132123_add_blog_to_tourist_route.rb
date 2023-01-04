class AddBlogToTouristRoute < ActiveRecord::Migration[7.0]
  def change
    add_reference :tourist_routes, :blog, null: true, foreign_key: true
  end
end
