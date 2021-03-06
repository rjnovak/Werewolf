class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :token_authenticatable, :validatable
         #:confirmable,
         

  # Setup accessible (or protected) attributes for your model
  attr_accessible :is_admin, :name, :email, :password, :password_confirmation, :pic, :score, :remember_me#, :authentication_token
  has_one :player
  # is_admin defaults to 0, pic should default to the default value, score should default to 0
  # validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation,  presence: true, length: { minimum: 6 }
  # validates :pic, presence: true

  before_create { self.is_admin = 0 }
  before_create { self.score = 0 }
  #before_create :authentication_token
  #before_create { self.authentication_token = nil}
  #before_create { self.pic = "default.png"}
  #before_create { self.name = self.email }
  before_save :ensure_authentication_token

  #def ensure_authentication
  #  if defined? self.authentication_token
  #    :ensure_authentication_token
  #  else
  #    :reset_authentication_token
  #  end
  #end
end
