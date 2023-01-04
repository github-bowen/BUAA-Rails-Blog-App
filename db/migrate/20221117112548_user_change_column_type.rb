class UserChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column(:users, :role, :integer)
  end
end
# usage:
# rails g migration user_change_column_type