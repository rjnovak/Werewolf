class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :is_admin, :name, :email, :password, :password_confirmation, :pic, :score, :remember_me
  has_one :player
  # is_admin defaults to 0, pic should default to the default value, score should default to 0
  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation,  presence: true, length: { minimum: 6 }
  validates :pic, presence: true

  before_create { self.is_admin = 0 }
  before_create { self.score = 0 }

  has_secure_password
end
