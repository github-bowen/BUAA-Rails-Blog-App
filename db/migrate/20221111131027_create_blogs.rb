class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :content
      t.integer :votes

      t.timestamps
    end
  end
end
