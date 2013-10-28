class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  attr_accessible :is_dead, :lat, :lon, :role, :votes, :votes_for, :user_id, :game_id
  
  # 0 = town, 1 = wolf
  validates :role, presence: true
  validates :user_id, presence: true
  validates :game_id, presence: true

  before_create { self.is_dead = 0 }
  before_create { self.votes = 0 }
end
