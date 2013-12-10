class Guest < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_save :default_value

	validates :name, presence: true
	validates :email, presence: true
	validates :wish, presence: true, length: { maximum: 200 }
	
	
	def default_value
		self.approved ||= true
	end
end
