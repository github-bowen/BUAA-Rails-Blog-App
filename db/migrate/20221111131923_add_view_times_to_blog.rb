class AddViewTimesToBlog < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :view_times, :integer
  end
end
