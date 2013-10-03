class Game < ActiveRecord::Base
  has_many :players
  attr_accessible :interval, :start
end
