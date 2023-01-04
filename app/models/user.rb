class User < ApplicationRecord
  # Include default users modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :validatable, authentication_keys: [:login]

  ## role
  validates :role, :username, presence: true
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  ## email, username
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  attr_writer :login
  attr_accessor :temp_username, :temp_email

  ## blogs
  has_many :blogs, dependent: :destroy
  has_many :tourist_routes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :avatar
  after_commit :add_default_avatar, on: [:create, :update]

  def get_or_default_avatar
    if avatar.attached?
      avatar
    else
      'default_avatar.png'
    end
  end

  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_avatar.png'
          )
        ),
        filename: 'default_avatar.png',
        content_type: 'image/png'
      )
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      User.where(username: login).or(User.where(email: login.downcase)).first
    else
      super
    end
  end

  def login
    @login || self.username || self.email
  end

  def set_default_role
    self.role ||= :user
  end

  def set_admin
    self.role = :admin
  end

  def get_role
    self.role == "user" ? "普通用户" : "管理员"
  end

  def get_pure_role
    self.role
  end

  def get_reversed_role
    self.role == "user" ? "管理员" : "普通用户"
  end

  def get_pure_reversed_role
    self.role == "user" ? "admin" : "user"
  end

  def admin?
    self.role == "admin"
  end

  #<User
  # id: 2,
  # email: "20231198@buaa.edu.cn",
  # created_at: "2022-11-17 12:46:57.828530000 +0000",
  # updated_at: "2022-11-17 14:08:06.490772000 +0000",
  # role: "admin">

end
