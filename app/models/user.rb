class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def mood
    if self.nausea.nil? || self.happiness.nil?
      nil
    elsif self.nausea > self.happiness
      "sad"
    elsif self.happiness > self.nausea
      "happy"
    else
      "content"
    end
  end

  def is_admin?
    self.admin
  end

end
