class RemoveContentFromBlog < ActiveRecord::Migration[7.0]
  def change
    remove_column :blogs, :content, :string
  end
end
