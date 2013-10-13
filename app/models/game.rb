class Game < ActiveRecord::Base
  has_many :players
  attr_accessible :interval, :start

  validates :interval, presence: true
  validates :start, presence: true
end
