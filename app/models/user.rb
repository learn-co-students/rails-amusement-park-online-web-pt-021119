class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  validates :name, presence: true, uniqueness: true
  validates :nausea, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }
  validates :happiness, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }
  validates :tickets, presence: true, numericality: { only_integer: true }
  has_secure_password

  def mood
    if :nausea > :happiness
      "sad"
    elsif :happiness > :nausea
      "happy"
    else
      "content"
    end
  end

  def is_admin?
    :admin
  end

end
