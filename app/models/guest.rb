class Guest < ActiveRecord::Base
	before_save { self.email = email.downcase }

	validates :name, presence: true
	validates :email, presence: true
	validates :wish, presence: true, length: { maximum: 200 }
end
