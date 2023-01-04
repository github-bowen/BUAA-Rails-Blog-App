class Comment < ApplicationRecord
  # attr_accessor :user_id
  validates :content, presence: true
  validates :user_id, presence: true
  belongs_to :blog
  belongs_to :user

end
