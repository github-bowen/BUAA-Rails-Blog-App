class Blog < ApplicationRecord
  validates :title, :content, :votes, :view_times, :user_id, presence: true

  has_many :comments, dependent: :delete_all

  has_rich_text :content

  # validates_length_of :title, maximum: 10, message: '你输入的标题太长啦~'

  belongs_to :user

  has_one :tourist_route, dependent: :nullify
  validates_presence_of :tourist_route

  attribute :votes, default: 0
  attribute :view_times, default: 0

  has_one_attached :image

  def get_or_default_image
    if image.attached?
      image
    else
      'empty_blog_img.jpg'
    end
  end

end
