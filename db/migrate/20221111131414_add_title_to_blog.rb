class AddTitleToBlog < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :title, :string
  end
end
