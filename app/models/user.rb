class User < ApplicationRecord
	has_secure_password
	has_many :rides
	has_many :attractions, through: :rides

	def mood
		if self.nausea != nil && self.happiness != nil 
			if self.nausea > self.happiness
				return "sad"
			elsif 
				self.happiness > self.nausea
				return "happy"
			end
		end
	end

end
