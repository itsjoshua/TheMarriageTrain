class Guest < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
	validates :wish, presence: true, length: { maximum: 200 }
end
