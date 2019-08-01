
require "pry"

class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if self.user.tickets >= self.attraction.tickets && self.user.height >= self.attraction.min_height
      @user = User.find(self.user_id)
      @user.tickets -= attraction.tickets
      @user.nausea += attraction.nausea_rating
      @user.happiness += attraction.happiness_rating
      @user.save
    elsif self.user.height >= self.attraction.min_height && self.user.tickets < self.attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif self.user.height <= self.attraction.min_height && self.user.tickets >= self.attraction.tickets
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
    return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
end
  end
end
