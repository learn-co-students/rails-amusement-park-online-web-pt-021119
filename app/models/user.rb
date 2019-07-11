class User < ApplicationRecord
	has_many :rides
	has_many :attractions, through: :rides

	has_secure_password

	validates :name, presence: true
	validates :name, uniqueness: true

	def mood

		unless self.admin
			if self.nausea > self.happiness
				"sad"
			else
				"happy"
			end
		end
	end

end
