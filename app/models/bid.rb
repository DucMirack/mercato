class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :player

  before_create do 
  	self.is_win = false
  	self.nb_round ||= self.user.nb_round
  	self.price ||= self.player.min_price
  end
end
